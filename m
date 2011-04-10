Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8tUq-0007UK-8H
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 14:12:04 +0200
Received: by qwh5 with SMTP id 5so2767649qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=amuTwYIvJZGZIQbCwM9NJvdqJKuJARTJx2lgPH4W6+g=;
	b=YnRAD4JVulEYA/SOSlTD/oe6dVmyijFwToCucy3jPkNS7kMimGvkmg90K+1rowPMAz
	421jYOq8IgfGaMXoKSj2BQht7CQXs6YoYDb+r/9cKG8j6e6zxmCeSraYBIV2BCgMDEhW
	OwCuWISPXZSWz1gRsOKnDBp3RqUDTlmGxbNvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qCQkngEpWNYbFZubPAmXYIuRjkvZUzAFetlx2iem8U7tFE6J4KrpITHlmozXVt/v4Y
	kPii587CIcGBOuRT1F8MY7z1RJHkQ65ExnHjijFBya3+j767CctViLXhzKebomu7uufi
	EXwvVjBerYIFjEEIm1wHzFB8Zq4WvHsQN6NDY=
MIME-Version: 1.0
Received: by 10.224.104.8 with SMTP id m8mr3387308qao.106.1302437390687; Sun,
	10 Apr 2011 05:09:50 -0700 (PDT)
Received: by 10.224.37.1 with HTTP; Sun, 10 Apr 2011 05:09:50 -0700 (PDT)
In-Reply-To: <20110410003311.GA32652@denix.org>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
	<1302328581-30367-3-git-send-email-heroor@gmail.com>
	<20110410003311.GA32652@denix.org>
Date: Sun, 10 Apr 2011 17:39:50 +0530
Message-ID: <BANLkTi=-Xg5SwOO4if-WfSMgkwiWXCKatw@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] libgles-omap3: Remove SGX Fixup for TI816x.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2011 12:12:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 10, 2011 at 6:03 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Apr 09, 2011 at 11:26:21AM +0530, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * Unlike OMAP3, the SGX core has not undergone revisions in TI816x.
>> =A0 The libraries for TI816x are also fixed and do not need fixup based
>> =A0 on revision of the SGX core.
>
> Sid,
>
> So, you are modifying generic rc script, which still apllies to OMAP3
> platforms, by removing fixups used in OMAP3... Is that correct?

The rc script has a switch case for different cputypes. This patch only mod=
ifies
the TI816x case. OMAP3 parts of the rc script are not modified.

>
> --
> Denys
>
>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> =A0recipes/powervr-drivers/libgles-omap3/rc.pvr | =A0 10 +++-------
>> =A01 files changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/recipes/powervr-drivers/libgles-omap3/rc.pvr b/recipes/powe=
rvr-drivers/libgles-omap3/rc.pvr
>> index 395d085..1b141a0 100755
>> --- a/recipes/powervr-drivers/libgles-omap3/rc.pvr
>> +++ b/recipes/powervr-drivers/libgles-omap3/rc.pvr
>> @@ -90,15 +90,11 @@ case $CPUTYPE in
>> =A0 =A0 =A0 devmem2 0x48180900 w 0x2
>> =A0 =A0 =A0 devmem2 0x48180920 w 0x2
>>
>> + =A0 =A0 sleep 2
>> +
>> =A0 =A0 =A0 ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:5:=
 -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}'=
)"
>>
>> - =A0 =A0 if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 echo -n "Starting SGX fixup for"
>> - =A0 =A0 =A0 =A0 =A0 =A0 echo " ES${ES_REVISION}.x"
>> - =A0 =A0 =A0 =A0 =A0 =A0 cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
>> - =A0 =A0 =A0 =A0 =A0 =A0 cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
>> - =A0 =A0 =A0 =A0 =A0 =A0 echo "${ES_REVISION}" > /etc/powervr-esrev
>> - =A0 =A0 fi
>> + =A0 =A0 echo "${ES_REVISION}" > /etc/powervr-esrev
>> =A0 =A0 =A0 /usr/bin/pvrsrvinit
>>
>> =A0 =A0 =A0 ;;
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


