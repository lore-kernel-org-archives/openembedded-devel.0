Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDomO-00033S-BJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 02:38:17 +0100
Received: by gyf3 with SMTP id 3so1047379gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 18:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vxNr2aDTq3edJLSFiBRGKmCuRA+mboHaOZKOw+C1Teo=;
	b=GxuL9r2kupLyHCmIaLGifEaO2TnrfYkvqS1RTo4DdRbaRFFgIKlq+MZOdwYlFs5pxB
	/GTUuLOCaICPI6LIBw48rWiDxzx2y5dkkrE7TXO4Y/eALAtjnizsheWnHSIaz8f6pjDc
	C6puN+kmcDBTGNa1LIPWkCwWW+JQyGyXs0fVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vd8S/in+uKfc2+lW/EeqygFTaawgaA75eTUX0p16A3GvA8Y9fxcwdnrlKGKGtNRM2a
	rTyPvXxMwTVsYUwu18xwGwi8C+io/BRMm9Dof2mWl5lIJZgEQWR3CeNYFf9e58gJwC7P
	eQYMJ8QkQiwrzZyDVA3fRSK7ZnRp54HViypWU=
Received: by 10.91.44.12 with SMTP id w12mr369143agj.64.1288834643690; Wed, 03
	Nov 2010 18:37:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 18:37:03 -0700 (PDT)
In-Reply-To: <AANLkTimO6whzKHNQ2eCUagkg-HD7Ke2CzPv6r65-Fc0L@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
	<AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
	<AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
	<AANLkTimO6whzKHNQ2eCUagkg-HD7Ke2CzPv6r65-Fc0L@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 18:37:03 -0700
Message-ID: <AANLkTi=F8n-nKQPhW35xmm2LRx_LnADO1vYN+LghJUL7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Thu, 04 Nov 2010 01:38:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 5:46 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Nov 3, 2010 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Nov 3, 2010 at 4:36 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>> I am having an issue of how libtool is building on my machine. I am
>>>>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>>>>> overo branch. Here is what happens when building:
>>>>>
>>>>> Error for openldap
>>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>>>>> ERROR: Function do_configure failed
>>>>> NOTE: Task failed: ('function do_configure failed',
>>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openl=
dap-2.4.23-r2/temp/log.do_configure.12815')
>>>>> ERROR: Logfile of failure stored in:
>>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openld=
ap-2.4.23-r2/temp/log.do_configure.12815
>>>>> Log data follows:
>>>>> | cp: cannot stat
>>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/share/libtool/ltmain.sh':
>>>>> No such file or directory
>>>>
>>>> can you add DEPENDS +=3D "libtool" to openldap_2.4.23.bb and retry ?
>>>
>>> Still getting this error and I cleaned and rebuilt both recipes
>>
>> try this patch and remove that DEPENDS
>>
>> diff --git a/recipes/openldap/openldap_2.4.23.bb
>> b/recipes/openldap/openldap_2.4.23.bb
>> index 3ac15f6..8afd951 100644
>> --- a/recipes/openldap/openldap_2.4.23.bb
>> +++ b/recipes/openldap/openldap_2.4.23.bb
>> @@ -188,7 +188,7 @@ DEPENDS =C2=A0 =C2=A0 =C2=A0+=3D "${OPENLDAP_DEPENDS=
}"
>> =C2=A0CPPFLAGS_append =3D " -D_GNU_SOURCE"
>>
>> =C2=A0do_configure() {
>> - =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${=
S}/build
>> + =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_ETCDIR_NATIVE}/libtool/config/ltmain=
.sh ${S}/build
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/libtool
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0aclocal
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force --copy
>>
>>
>>>
>>> ERROR: Logfile of failure stored in:
>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap=
-2.4.23-r2/temp/log.do_configure.2783
>>> Log data follows:
>>> | cp: cannot stat
>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/share/libtool/ltmain.sh':
>>> No such file or directory
>>> | ERROR: Function do_configure failed
>>> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>>>
>>>
>>> libtool does not build to this location
>>> /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/=
share/libtool/
>>> it builds to here
>>> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/s=
ysroots/x86_64-linux/usr/share/libtool/
>>>
>>> It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instead
>>> of being in front of the tmp/sysroot like most things
>>>
>>> same with aclocal and aclocal-1.11
>>>
>>> Thanks
>>>
>>> JL
>>>>
>>>>
>>>> -khem
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Did as you asked and also deleted the tmp/ dir to just make sure was
> nothing in there and rebuilt. And must not have done something right
> as the patch failed with this:
> ERROR: Logfile of failure stored in:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2=
.4.23-r2/temp/log.patch_do_patch.22762
> Log data follows:
> | ERROR: Error in executing python function in:
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.=
4.23.bb
> | ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error:
> exit status: 1 =C2=A0Output:
> | Applying patch test-fix.patch
> | patching file recipes/openldap/openldap_2.4.23.bb
> | Hunk #1 FAILED at 188.
> | 1 out of 1 hunk FAILED -- rejects in file recipes/openldap/openldap_2.4=
.23.bb
> | Patch test-fix.patch does not apply (enforce with -f)
> | ERROR: Printing the environment of the function
> | ERROR: Function patch_do_patch failed
> NOTE: package openldap-2.4.23-r2: task do_patch: Failed
> =C2=A0I have attached the patch and the .bb so you can see what and how I=
 did it.
>

crap.
dude you make that one line change in the recipe .bb file *by hand*
its not a patch for the sources
but for the recipe.


> Thanks for the help so far.
>
> JL
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


