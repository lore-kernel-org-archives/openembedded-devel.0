Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M79J0-0000mO-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:31:34 +0200
Received: by bwz19 with SMTP id 19so1072155bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=e2xNWbcW1/pWnkclBuzGj8CAlil2XSyslBNX9do2DY8=;
	b=bw25lg113KvA2bF1c6csYwUbkSwKw3/QemgoYDVdLQZb3wgU4FzFiOzUIPbpz+5olB
	zz/+cZGPZV/Wz59WSvV3qv7Kb7xMVBWX08rzXU0ditbZSYGwE3N8F68oFmlwMlHdiwkx
	MOsvNhYC4754Me5UMAK08jo7c1Fb04Jkpv7Fw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=D3SsbjF2DV76+hPE4mEZ2QuchqlSO9lv7dBh1c2QDgUtNazqstO1pBU3FTcXa92cch
	ezzco0u7/ITJWxD6JQALrM7RQMAgPmSyjd81h7ZPp7AegqfI2seL53eaZeWqLQyTkwxJ
	CslrO+jLE2KpLrKoLBkRzVHudmFDyX+zaNSu4=
MIME-Version: 1.0
Received: by 10.103.181.2 with SMTP id i2mr1410964mup.20.1242915836848; Thu, 
	21 May 2009 07:23:56 -0700 (PDT)
In-Reply-To: <gv3n7s$1gg$1@ger.gmane.org>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
	<gv3n7s$1gg$1@ger.gmane.org>
Date: Thu, 21 May 2009 17:23:56 +0300
Message-ID: <fce2a370905210723l75e66df0u9b65569940870825@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 14:31:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2009 at 5:07 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 21-05-09 15:21, Ihar Hrachyshka wrote:
>>
>> This fixes package name matching so that gst-plugins-*-meta
>> packages include all the plugin ones. The current matching
>> implementation doesn't make meta packages depend on gst-plugins
>> with 'locale' and 'dev' in their names (f.e. gstfbdevsink).
>
> This patch looks OK, but you need to bump PR for the affected recipes as
> well. (Someone will probably mention INC_PR soon ;))

Ok, I'll resend it in a while.

>
> regards,
>
> Koen
>
>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>> ---
>> =C2=A0recipes/gstreamer/gst-plugins.inc | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gstreamer/gst-plugins.inc
>> b/recipes/gstreamer/gst-plugins.inc
>> index bcb3e39..0156cff 100644
>> --- a/recipes/gstreamer/gst-plugins.inc
>> +++ b/recipes/gstreamer/gst-plugins.inc
>> @@ -33,7 +33,7 @@ python populate_packages_prepend () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg_rdepends =3D []
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0packages =3D bb.data.getVar('PACKAGES', d, 1)=
.split()
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in packages[1:]:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkg in blackli=
st and not pkg in metapkg_rdepends
>> and not pkg.count('dev') and not pkg.count( 'locale' ):
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkg in blackli=
st and not pkg in metapkg_rdepends
>> and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0metapkg_rdepends.append(pkg)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('RDEPENDS_' + metapkg, ' '.joi=
n(metapkg_rdepends),
>> d)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('DESCRIPTION_' + metapkg, pn +=
 ' meta package', d)
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


