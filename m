Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M79IA-0000lJ-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:30:42 +0200
Received: by an-out-0708.google.com with SMTP id b6so645332ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=stqWu8DeJKtpsPAFAZHiGDTh2rCupF6n+i0c5pSivT4=;
	b=VepjcyNGOzwC4WWC65TLfUej2guuLm91lqDAfM9vKml0u1lmaDB7p45wIOX2NVDRHo
	j7v+ZAz+VWK0eUUTn0tibGiNwDvQ3oUHt5wuoH/OT4xhCl08tYMCzqctAcJb1zYgwEGb
	7OolATZDgPT89phn91v60k1U6BzlOW14zWIxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=dpPcZyeDbaUB0hl+8piHYsYkFUDzDZkuHttJp9MT3ibUBmFOIoBcfQ3jnMA0w6iXKB
	1hUqUIDmEMm0inz0sp9FnaxIh7hB1MX873fKfifRou+PdswnCYT5nHw4sKt0r3PrVGX5
	hY8jaXZP18IvLbUNiUTcvfvgHswLeUaQY7DWI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.14.2 with SMTP id 2mr5202822ann.68.1242915786853; Thu, 21 
	May 2009 07:23:06 -0700 (PDT)
In-Reply-To: <gv3n7s$1gg$1@ger.gmane.org>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
	<gv3n7s$1gg$1@ger.gmane.org>
Date: Thu, 21 May 2009 11:23:06 -0300
X-Google-Sender-Auth: 75933a2859f1a47c
Message-ID: <be7a9f3d0905210723h5a223233t8cf5bf62534e974@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Thu, 21 May 2009 14:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 for INC_PR :-)

On Thu, May 21, 2009 at 11:07 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 21-05-09 15:21, Ihar Hrachyshka wrote:
>>
>> This fixes package name matching so that gst-plugins-*-meta
>> packages include all the plugin ones. The current matching
>> implementation doesn't make meta packages depend on gst-plugins
>> with 'locale' and 'dev' in their names (f.e. gstfbdevsink).
>
> This patch looks OK, but you need to bump PR for the affected recipes as
> well. (Someone will probably mention INC_PR soon ;))
>
> regards,
>
> Koen
>
>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>> ---
>> =A0recipes/gstreamer/gst-plugins.inc | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gstreamer/gst-plugins.inc
>> b/recipes/gstreamer/gst-plugins.inc
>> index bcb3e39..0156cff 100644
>> --- a/recipes/gstreamer/gst-plugins.inc
>> +++ b/recipes/gstreamer/gst-plugins.inc
>> @@ -33,7 +33,7 @@ python populate_packages_prepend () {
>> =A0 =A0 =A0 =A0metapkg_rdepends =3D []
>> =A0 =A0 =A0 =A0packages =3D bb.data.getVar('PACKAGES', d, 1).split()
>> =A0 =A0 =A0 =A0for pkg in packages[1:]:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not pkg in blacklist and not pkg in met=
apkg_rdepends
>> and not pkg.count('dev') and not pkg.count( 'locale' ):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not pkg in blacklist and not pkg in met=
apkg_rdepends
>> and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0metapkg_rdepends.append(p=
kg)
>> =A0 =A0 =A0 =A0bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rd=
epends),
>> d)
>> =A0 =A0 =A0 =A0bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta pack=
age', d)
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


