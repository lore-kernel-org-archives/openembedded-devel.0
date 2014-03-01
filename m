Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C3EEC6EE45
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 04:33:55 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id f8so1350339wiw.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Dk2gY1g7Y2DzAUGRXcbJHJEQ5wWk+J5qT+FUHBPvrU8=;
	b=guyixZjJBspC52YlQHxxOMhzD/e3O+AHT3ywtZ7hXihFipibt1rrKE+Ky49mty89GC
	TfHlUU5FmRYz2cy8D85//O/W/S0o7dhmMJzfA++Rxg5mvRVgJtMtmjamvCMlciCZX1a/
	G4cUPoO9JkrgtGggiOSAS7e2jD7zz3AXESgdvRh5u6KSKnYDwNAwsaEGVmRqkEcBh8eP
	VAj2LxO+dU/JHVLLLqWYCitdAiBAci750u9JeVwUnrbfbMtLh8mBBqikxZXCnScqkbvL
	0K0WzG8HdyKQskYXY7euUvOtJltCrJcj4cPR1/TMIhdyk0dvdr701nX6IVmLSyi1+Bgk
	riXw==
MIME-Version: 1.0
X-Received: by 10.180.164.229 with SMTP id yt5mr6306350wib.49.1393648435425;
	Fri, 28 Feb 2014 20:33:55 -0800 (PST)
Received: by 10.194.59.228 with HTTP; Fri, 28 Feb 2014 20:33:55 -0800 (PST)
In-Reply-To: <53103D8E.4070105@windriver.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<20130610152954.GF9561@windriver.com>
	<53103D8E.4070105@windriver.com>
Date: Fri, 28 Feb 2014 20:33:55 -0800
Message-ID: <CAOLEWZWHfoUz0c+GW+MFqx-u=9NM9VJnANAB6YP9Wh56grtEaA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Mar 2014 04:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry I missed the previous traffic, but does it make more sense to set the
ntp user's home to something like /var/lib/ntp instead?  For me it's always
been that way as the typical place for the drift file (written to by the
ntpd process running as ntp) as well as a *.keys file it needed.  IMHO the
above with a suitable line in the default ntp.conf would be a Good Thing.

Lastly, what about using pool.ntp.org as the default server for both ntpd
and ntpdate?  That way everything works out of the box (as long as there's
a net connection) and users can customize from there.  I have a bbappend
for ntp right now, so maybe I should look at the default config again...


On Thu, Feb 27, 2014 at 11:41 PM, Xufeng Zhang
<xufeng.zhang@windriver.com>wrote:

> On 06/10/2013 11:29 PM, Joe MacDonald wrote:
>
>> Hey Xufeng,
>>
>> [[oe] [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors] On
>> 13.05.31 (Fri 14:18) Xufeng Zhang wrote:
>>
>>
>>
>>> The main changes include:
>>> 1). Add ntp:ntp(user:group) to system.
>>> 2). Running ntpd dameon as ntp:ntp.
>>> 3). Move relevant files from /usr/bin to /usr/sbin.
>>> 4). Add crypto support.
>>>
>>>
>> This one seems to have trailed off.  Sorry if you guys were waiting on
>> my input as well.
>>
>>
>
> Sorry for late response, I have missed this email.
>
>  First, I agree with Paul on both #3 and #4.
>>
>
> Now I also agree that I should drop #4.
>
>  I would rather see a patch
>> that updates NTP to use sbindir instead of bindir in the options
>>
>
> I'm not quite understand what's the meaning of "in the options".
>
> I'll explain how "--with-binsubdir" works for ntp:
> "--with-binsubdir" controls whether we use bin_PROGRAMS or sbin_PROGRAMS
> for built binaries in Makefile, in others words, it controls where we
> install the
> binaries. If "--with-binsubdir" is not set or if "--with-binsubdir=bin",
> then we use
> bindir, otherwise, if "--with-binsubdir=sbin", we use sbindir, so if we
> want to
> install the binaries into sbindir, we must specify "--with-binsubdir=sbin".
>
>
>  (or at
>> least a follow-up indicating that it's infeasible for some reason, I
>> also don't know what NTP's build system looks like, so maybe that's not
>> an option).  I also agree that my preferred scenario is for the system
>> to be as secure as possible by default, but crypto support is available
>> and not everyone wants or needs it.  We (relatively) recently when
>> through an extended discussion about ntp versus ntp-ssl and the current
>> situation seems to be the best compromise for everyone.
>>
>> As a more general comment, you have four bullet-points below.  That's
>> normally an indication (to me, at least) that four patches are
>> appropriate.  Looking a bit closer, it looks like two related changes
>> and two unrelated ones, so I'd want to see three patches for this unless
>> there's a good reason why all of them are tied together.
>>
>> #1 and #2 aren't likely to be contentious, so feel free to send out a
>> single patch doing both of those any time and we can revisit #3 and #4
>> at your convenience.
>>
>>
>
> Thank you very much for the detail suggestions and explanations!
> I'll send V2 patch until we come to a agreement on #3.
>
>
> Xufeng
>
>  Thanks,
>> -J.
>>
>>
>>
>>> [YOCTO #4567]
>>> [ CQID: WIND00417282 ]
>>>
>>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>> ---
>>>   meta-networking/recipes-support/ntp/files/ntpd    |    8 ++++----
>>>   meta-networking/recipes-support/ntp/files/ntpdate |    6 +++---
>>>   meta-networking/recipes-support/ntp/ntp.inc       |   20
>>> ++++++++++++--------
>>>   3 files changed, 19 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/meta-networking/recipes-support/ntp/files/ntpd
>>> b/meta-networking/recipes-support/ntp/files/ntpd
>>> index ae50f13..285f5c0 100755
>>> --- a/meta-networking/recipes-support/ntp/files/ntpd
>>> +++ b/meta-networking/recipes-support/ntp/files/ntpd
>>> @@ -1,7 +1,7 @@
>>>   #! /bin/sh
>>>   #
>>>   # ntpd        init.d script for ntpdc from ntp.isc.org
>>> -test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
>>> +test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
>>>   # rcS contains TICKADJ
>>>   test -r /etc/default/rcS&&  . /etc/default/rcS
>>>
>>> @@ -9,9 +9,9 @@ test -r /etc/default/rcS&&  . /etc/default/rcS
>>>   settick(){
>>>         # If TICKADJ is set we *must* adjust it before we start, because
>>> the
>>>         # driftfile relies on the correct setting
>>> -       test -n "$TICKADJ" -a -x /usr/bin/tickadj&&  {
>>> +       test -n "$TICKADJ" -a -x /usr/sbin/tickadj&&  {
>>>                 echo -n "Setting tick to $TICKADJ: "
>>> -               /usr/bin/tickadj "$TICKADJ"
>>> +               /usr/sbin/tickadj "$TICKADJ"
>>>                 echo "done"
>>>         }
>>>   }
>>> @@ -21,7 +21,7 @@ startdaemon(){
>>>         # this.  If ntpd seems to disappear after a while assume TICKADJ
>>>         # above is set to a totally incorrect value.
>>>         echo -n "Starting ntpd: "
>>> -       start-stop-daemon --start -x /usr/bin/ntpd -- -p
>>> /var/run/ntp.pid "$@"
>>> +       start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p
>>> /var/run/ntp.pid "$@"
>>>         echo "done"
>>>   }
>>>   stopdaemon(){
>>> diff --git a/meta-networking/recipes-support/ntp/files/ntpdate
>>> b/meta-networking/recipes-support/ntp/files/ntpdate
>>> index ab0551c..17b64d1 100755
>>> --- a/meta-networking/recipes-support/ntp/files/ntpdate
>>> +++ b/meta-networking/recipes-support/ntp/files/ntpdate
>>> @@ -1,8 +1,8 @@
>>>   #!/bin/sh
>>>
>>> -PATH=/sbin:/bin:/usr/bin
>>> +PATH=/sbin:/bin:/usr/bin:/usr/sbin
>>>
>>> -test -x /usr/bin/ntpdate || exit 0
>>> +test -x /usr/sbin/ntpdate || exit 0
>>>
>>>   if test -f /etc/default/ntpdate ; then
>>>   . /etc/default/ntpdate
>>> @@ -40,7 +40,7 @@ if [ -x /usr/bin/lockfile-create ]; then
>>>         LOCKTOUCHPID="$!"
>>>   fi
>>>
>>> -if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
>>> +if /usr/sbin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
>>>         if [ "$UPDATE_HWCLOCK" = "yes" ]; then
>>>                 hwclock --systohc || :
>>>         fi
>>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc
>>> b/meta-networking/recipes-support/ntp/ntp.inc
>>> index 79e7401..b52a7d6 100644
>>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>>> @@ -24,14 +24,19 @@ SRC_URI = "http://www.eecis.udel.edu/~
>>> ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>>>              file://sntp \
>>>   "
>>>
>>> -inherit autotools update-rc.d systemd
>>> +inherit autotools update-rc.d systemd useradd
>>>
>>>   # The ac_cv_header_readline_history is to stop ntpdc depending on
>>> either
>>>   # readline or curses
>>> -EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd
>>> ac_cv_header_readline_history_h=no"
>>> +EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd
>>> ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
>>>   CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
>>>
>>> -PACKAGECONFIG ??= ""
>>> +USERADD_PACKAGES = "${PN}"
>>> +USERADD_PARAM_${PN} = "--system --home /etc/ntp \
>>> +                      --no-create-home --shell /bin/false \
>>> +                      --user-group ntp"
>>> +
>>> +PACKAGECONFIG ??= "openssl"
>>>   PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
>>>                             --with-openssl-incdir=${STAGING_INCDIR} \
>>>                             --with-crypto, \
>>> @@ -91,10 +96,10 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
>>>
>>>   RSUGGESTS_${PN} = "iana-etc"
>>>
>>> -FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf
>>> ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
>>> -FILES_${PN}-tickadj = "${bindir}/tickadj"
>>> -FILES_${PN}-utils = "${bindir}"
>>> -FILES_ntpdate = "${bindir}/ntpdate \
>>> +FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf
>>> ${sysconfdir}/init.d/ntpd ${libdir}"
>>> +FILES_${PN}-tickadj = "${sbindir}/tickadj"
>>> +FILES_${PN}-utils = "${sbindir}"
>>> +FILES_ntpdate = "${sbindir}/ntpdate \
>>>       ${sysconfdir}/network/if-up.d/ntpdate-sync \
>>>       ${bindir}/ntpdate-sync \
>>>       ${sysconfdir}/default/ntpdate \
>>> @@ -122,4 +127,3 @@ else
>>>       fi
>>>   fi
>>>   }
>>> -
>>>
>>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

