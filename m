Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RTYgE-000113-3e
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 13:45:30 +0100
Received: by yenm2 with SMTP id m2so2514307yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 04:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=H5drVpMKeU1d+IkbPMdQwQi2zWcpE7N0PanYnhR9w4g=;
	b=QWd2Ty6V2U6CbTx9+BVMIta0GRrvdXM8EQ89fU07XaV/eP7/X8iBCKSofKg8TqqM/v
	PJlGtAqTMtYOZqOpeDceHCNEFz13gn1qLUySUn5GXPKWS4Miju1ZK+u5i6Hv2NGEqlme
	Fn5pAJdAEHrYBup1el9uJ0KnkGJUKjKT0VnDk=
MIME-Version: 1.0
Received: by 10.236.154.166 with SMTP id h26mr40519332yhk.88.1322138333216;
	Thu, 24 Nov 2011 04:38:53 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Thu, 24 Nov 2011 04:38:53 -0800 (PST)
In-Reply-To: <CAAQYJAv=z6msRfaR3bj7PfWrm=tuv8opBPjfD9nkpSrwAUgRbQ@mail.gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
	<0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
	<19b573f112f191ea9dd166e3be7edc8310725198.1322129758.git.Martin.Jansa@gmail.com>
	<CAAQYJAv=z6msRfaR3bj7PfWrm=tuv8opBPjfD9nkpSrwAUgRbQ@mail.gmail.com>
Date: Thu, 24 Nov 2011 13:38:53 +0100
Message-ID: <CAAQYJAvgLfieUK43nQOKL+H6omoXjuASrwPP4GZFc66bL+WMrg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld 4/6] linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG not just loglevel=3
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
X-List-Received-Date: Thu, 24 Nov 2011 12:45:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 12:01 PM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> On Thu, Nov 24, 2011 at 11:18 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> =A0recipes-kernel/linux/linux-kexecboot.inc | =A0 14 +++++++++++---
>> =A01 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/l=
inux/linux-kexecboot.inc
>> index 83b7018..220bf36 100644
>> --- a/recipes-kernel/linux/linux-kexecboot.inc
>> +++ b/recipes-kernel/linux/linux-kexecboot.inc
>> @@ -108,9 +108,17 @@ do_configure_prepend() {
>> =A0 =A0 =A0 =A0 kernel_conf_variable KEXEC y
>> =A0 =A0 =A0 =A0 CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /=3Dm/d;"
>> =A0 =A0 =A0 =A0 kernel_conf_variable MODULES n
>> - =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS n
>> - =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE n
>> - =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL n
>> + =A0 =A0 =A0 =A0if [ "${CMDLINE_DEBUG}" =3D "loglevel=3D3" ] ; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS n
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE n
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL n
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PRINTK y
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable BUG y
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS y
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE y
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL y
>> + =A0 =A0 =A0 fi
>>
>> =A0 =A0 =A0 =A0 # Force lzma for arm kernels only
>> =A0 =A0 =A0 =A0 if [ "${ARCH}" =3D "arm" ] ; then
>> --
>> 1.7.8.rc3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> The idea is good!
> The weak point is EXTRA_IMAGE_FEATURES =3D "debug-tweaks" , default in lo=
cal.conf.

Hm.. and what about using  "tools-debug" instead?

Andrea


>
> Remember for collie we have to watch the kernel size! I'm not sure we
> respect the limit, probably yes.
> No problem on other Zaurus, unless we want to renable networking and usb.
>
> Regards
>
> Andrea
>


