Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PDuR6-0002ht-Rv
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:40:41 +0100
Received: by qwd6 with SMTP id 6so956164qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZdsQUXEHDXD7BfLRRRZW/06aAxK9tmY6EC/bzpzAeqI=;
	b=S3coHf17R5tJ7FbM+mahjG1pdZwTtpKLi/GETP7oYEF9A7ttGuX1c/Y8NbXs3ru10B
	yOmsGkeZU8NyGKWG346XLwZi/annxciGJgxTs9Jc1Uhf7gSxsyLGQIp7C4Jxay3yYGL3
	IOGoTEcDFMGoHZcAKJmeEQANAYTbZTF/8Ih28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qukyWHArCvNR84gnlr5B87xr7vOdKggKbDL09DU/2w1wyGH/LoxNN8OcRTvDHU3Hob
	QJhuQoh6vI+u2dssJI2nSvdpQqFFEProwRHzljSjxoji2NwQccFBFQD+KU3D+FZKDvsU
	H+/km8gS2GNXg8LPKyUzuSl1QLdTlSnxpIPkI=
MIME-Version: 1.0
Received: by 10.229.70.130 with SMTP id d2mr364476qcj.53.1288856387346; Thu,
	04 Nov 2010 00:39:47 -0700 (PDT)
Received: by 10.220.118.5 with HTTP; Thu, 4 Nov 2010 00:39:47 -0700 (PDT)
In-Reply-To: <AANLkTikemy4VUkVAjk8zBtB6+jT=Q2VV1vAojrNwQP9O@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
	<AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
	<AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
	<AANLkTimO6whzKHNQ2eCUagkg-HD7Ke2CzPv6r65-Fc0L@mail.gmail.com>
	<AANLkTi=F8n-nKQPhW35xmm2LRx_LnADO1vYN+LghJUL7@mail.gmail.com>
	<AANLkTikemy4VUkVAjk8zBtB6+jT=Q2VV1vAojrNwQP9O@mail.gmail.com>
Date: Thu, 4 Nov 2010 00:39:47 -0700
Message-ID: <AANLkTikKjYKJNqMONi+Xq5q-nkkpaWFk9SbT5nipWKUR@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems building openldap and libtool
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
X-List-Received-Date: Thu, 04 Nov 2010 07:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 4, 2010 at 12:27 AM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Nov 3, 2010 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Nov 3, 2010 at 5:46 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> On Wed, Nov 3, 2010 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Wed, Nov 3, 2010 at 4:36 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>> On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>>>> I am having an issue of how libtool is building on my machine. I am
>>>>>>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>>>>>>> overo branch. Here is what happens when building:
>>>>>>>
>>>>>>> Error for openldap
>>>>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>>>>>>> ERROR: Function do_configure failed
>>>>>>> NOTE: Task failed: ('function do_configure failed',
>>>>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/ope=
nldap-2.4.23-r2/temp/log.do_configure.12815')
>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/open=
ldap-2.4.23-r2/temp/log.do_configure.12815
>>>>>>> Log data follows:
>>>>>>> | cp: cannot stat
>>>>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/share/libtool/ltmain.sh':
>>>>>>> No such file or directory
>>>>>>
>>>>>> can you add DEPENDS +=3D "libtool" to openldap_2.4.23.bb and retry ?
>>>>>
>>>>> Still getting this error and I cleaned and rebuilt both recipes
>>>>
>>>> try this patch and remove that DEPENDS
>>>>
>>>> diff --git a/recipes/openldap/openldap_2.4.23.bb
>>>> b/recipes/openldap/openldap_2.4.23.bb
>>>> index 3ac15f6..8afd951 100644
>>>> --- a/recipes/openldap/openldap_2.4.23.bb
>>>> +++ b/recipes/openldap/openldap_2.4.23.bb
>>>> @@ -188,7 +188,7 @@ DEPENDS =A0 =A0 =A0+=3D "${OPENLDAP_DEPENDS}"
>>>> =A0CPPFLAGS_append =3D " -D_GNU_SOURCE"
>>>>
>>>> =A0do_configure() {
>>>> - =A0 =A0 =A0 cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/buil=
d
>>>> + =A0 =A0 =A0 cp ${STAGING_ETCDIR_NATIVE}/libtool/config/ltmain.sh ${S=
}/build
>>>> =A0 =A0 =A0 =A0rm -f ${S}/libtool
>>>> =A0 =A0 =A0 =A0aclocal
>>>> =A0 =A0 =A0 =A0libtoolize --force --copy
>>>>
>>>>
>>>>>
>>>>> ERROR: Logfile of failure stored in:
>>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openld=
ap-2.4.23-r2/temp/log.do_configure.2783
>>>>> Log data follows:
>>>>> | cp: cannot stat
>>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/share/libtool/ltmain.sh':
>>>>> No such file or directory
>>>>> | ERROR: Function do_configure failed
>>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>>>>>
>>>>>
>>>>> libtool does not build to this location
>>>>> /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/share/libtool/
>>>>> it builds to here
>>>>> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp=
/sysroots/x86_64-linux/usr/share/libtool/
>>>>>
>>>>> It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instead
>>>>> of being in front of the tmp/sysroot like most things
>>>>>
>>>>> same with aclocal and aclocal-1.11
>>>>>
>>>>> Thanks
>>>>>
>>>>> JL
>>>>>>
>>>>>>
>>>>>> -khem
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> Did as you asked and also deleted the tmp/ dir to just make sure was
>>> nothing in there and rebuilt. And must not have done something right
>>> as the patch failed with this:
>>> ERROR: Logfile of failure stored in:
>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap=
-2.4.23-r2/temp/log.patch_do_patch.22762
>>> Log data follows:
>>> | ERROR: Error in executing python function in:
>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_=
2.4.23.bb
>>> | ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error:
>>> exit status: 1 =A0Output:
>>> | Applying patch test-fix.patch
>>> | patching file recipes/openldap/openldap_2.4.23.bb
>>> | Hunk #1 FAILED at 188.
>>> | 1 out of 1 hunk FAILED -- rejects in file recipes/openldap/openldap_2=
.4.23.bb
>>> | Patch test-fix.patch does not apply (enforce with -f)
>>> | ERROR: Printing the environment of the function
>>> | ERROR: Function patch_do_patch failed
>>> NOTE: package openldap-2.4.23-r2: task do_patch: Failed
>>> =A0I have attached the patch and the .bb so you can see what and how I =
did it.
>>>
>>
>> crap.
>> dude you make that one line change in the recipe .bb file *by hand*
>> its not a patch for the sources
>> but for the recipe.
>>
>>
>>> Thanks for the help so far.
>>>
>>> JL
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Sorry didnt catch it was for the recipe my bad. I changed the line and
> still a no go, it's still looking where libtool does not build to.
>
> ERROR: Build of
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.=
4.23.bb
> do_configure failed
> NOTE: Running task 4058 of 9443 (ID: 6423,
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.=
4.23.bb,
> do_configure)
> ERROR: Task 6423
> (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2=
.4.23.bb,
> do_configure) failed with 256
> NOTE: package openldap-2.4.23-r2: task do_configure: Started
> ERROR: Function do_configure failed
> NOTE: Task failed: ('function do_configure failed',
> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-=
2.4.23-r2/temp/log.do_configure.14912')
> ERROR: Logfile of failure stored in:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2=
.4.23-r2/temp/log.do_configure.14912
> Log data follows:
> | cp: cannot stat
> `/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/etc/libtool/config/ltm=
ain.sh':
> No such file or directory
> | ERROR: Function do_configure failed
> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>
> Thanks for the help suggestions so far. I think for some reason
> libtool does not build properly from how I read as to how its shows
> its installed on the system
> =A0tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/=
sysroots/x86_64-linux/usr/share/libtool/
>



Sorry but just noticed in the libtool recipe this line
FILES_${PN} +=3D "${datadir}/aclocal*"
My aclocal and aclocal-1.11 dont appear to be building to the proper
location either for some reason they build to here

find tmp/sysroots -name "aclocal"
tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysro=
ots/x86_64-linux/usr/share/aclocal
 -- this one is the same place libtool goes to as you can see for some
reason my home and username /home/vdubhack/overo-oe gets thrown in for
some reason in the middle of it.

Here is the rest of the places it goes to.
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal
tmp/sysroots/x86_64-linux/usr/share/aclocal
tmp/sysroots/x86_64-linux/usr/armv7a/share/aclocal
tmp/sysroots/x86_64-linux/usr/bin/aclocal

aclocal-1.11 does the same
find tmp/sysroots -name "aclocal-1.11"
tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysro=
ots/x86_64-linux/usr/share/aclocal-1.11
 -- /home/vdubhack/overo-oe gets thrown in the wrong place here as
well

And the rest of the aclocal-1.11 places it gets installed to.
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11
tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
tmp/sysroots/x86_64-linux/usr/armv7a/share/aclocal-1.11
tmp/sysroots/x86_64-linux/usr/bin/aclocal-1.11


Hope this might help more. Thanks again.
JL


