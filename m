Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OM4vY-0005HV-74
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 21:57:37 +0200
Received: by ewy21 with SMTP id 21so39766ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type; bh=FzuIwyiz3X5FC8SjxBwWXNDLziVsc+4Br6Mzq3/oy90=;
	b=J6s0btyaul0x7IVYnT7fyUN/hE2UMf7b00sAiGDwcJ6hots1KN0Bc4Urjnb7hAt74d
	62DJSslgKmKiQquuKG7vo8JQZpOmmt0USfBVHU4Iq63SsDjN4gd4BX8nW+V5YLVvElKF
	ve+yE3VBEM1A0j5gw+s4TpfisL023QbmFZsuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=QDj1PuhJOrD2+FgtEJsnGQFFG7SLbd7gdsZnGqHdVanTJxI0wBCoPNbNC2u9lEUHiL
	x+5FH6adLuMb62IBzFnlq/ie0UQu1zA2UUWJrV5B5HrccxQtEPTe5RTPzqaBSeuqYZDP
	VzoHgzDVvUK9fgAK/ZpzC8U6BzSdsMF7W0OUg=
Received: by 10.213.31.143 with SMTP id y15mr222859ebc.14.1276026793993;
	Tue, 08 Jun 2010 12:53:13 -0700 (PDT)
Received: from [192.168.1.103] (206.211-240-81.adsl-dyn.isp.belgacom.be
	[81.240.211.206])
	by mx.google.com with ESMTPS id 15sm3559542ewy.0.2010.06.08.12.53.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Jun 2010 12:53:12 -0700 (PDT)
Message-ID: <4C0E9FA6.50804@gmail.com>
Date: Tue, 08 Jun 2010 21:53:10 +0200
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100607 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>	<1275510896-30845-7-git-send-email-raj.khem@gmail.com>	<hu6fm8$gg4$2@dough.gmane.org>
	<20100604002902.GA24343@gmail.com>
	<AANLkTimLGz3yNOafixBe0Mfkb1f_jLUK44Ubq68W1eUa@mail.gmail.com>
In-Reply-To: <AANLkTimLGz3yNOafixBe0Mfkb1f_jLUK44Ubq68W1eUa@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.221
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 06/16] db_5.0.21: Add recipes for target and native packages.
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
X-List-Received-Date: Tue, 08 Jun 2010 19:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/04/2010 09:38 AM, Martin Jansa wrote:
> On Fri, Jun 4, 2010 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On (02/06/10 22:41), Koen Kooi wrote:
> On 02-06-10 22:34, Khem Raj wrote:
> >>>> * Get rid of old style staging.
> >>>>
> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>> ---
> >>>>  recipes/db/db-native_4.2.52.bb             |    1 -
> >>>>  recipes/db/db-native_5.0.21.bb             |    2 +
>
> Can these get converted to BBCLASSEXTEND?
> >>
> >> Yes. I have intended to do that afterwards
>
> > Then
>
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> >>
>
> regards,
>
> Koen
Sorry to be the bearer of bad news, but libpam_1.1.0.bb doesn't like
this new berkley db.
Got compile errors on module/pam_userdb.c, anything related to dbm_...
functions that return and assign a value. As far as I can tell from the
source of db.h there is a define missing: HAVE_DBM. Adding this to the
compile line: -DHAVE_DBM=1 makes it compile fine but I haven't found
where to set it from the configure flags and if indeed this is the
correct thing to do.
For now, might I suggest a DEFAULT_PREFERENCE = "-1" to be added to
db_5.0.21.bb.

Regards,

Jan

