Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PPMDP-0007FQ-2M
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 22:33:52 +0100
Received: by wyb40 with SMTP id 40so11594391wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Dec 2010 13:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LhvZqKvyi5l5PPnaBY8U01eboLpHxIC0eLKSc5YFMeg=;
	b=i/SyQn/jRT/PadCdx0xqOMLf+XzFF13fE6RSwGl9DnJgoXjCTAubVcxsslHGB5WdWV
	kJGFDaAzd22tWGtaMsvELov9A/7wc2jav5opYYPtsnbFGcTbqhvcg4hP/etI8mACRH33
	UZOtz0YdiDava8jjeSQKOzThdwJsUb+wkRWfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WYdt5YYm85isdgOgvHOYKDQggeY9IzoYO9DpOwT8XrNYZQ53JDE0G3QWt4LL+fIn9e
	ONPM1cz8WEZ8fhTIOwvozNe+c5lJTuatzEH80kR9gX737Z3m+A314pPwE/0cqG7Khijo
	luFFR5uZPTzs79ZqtQ59kB7lHra+OZCdq1Pcw=
MIME-Version: 1.0
Received: by 10.227.195.144 with SMTP id ec16mr4852825wbb.20.1291584742609;
	Sun, 05 Dec 2010 13:32:22 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Sun, 5 Dec 2010 13:32:22 -0800 (PST)
In-Reply-To: <1291579960.7355.8.camel@matthew-laptop>
References: <1291564968-3502-1-git-send-email-matthewbot@gmail.com>
	<4CFBBA1C.4080103@eukrea.com>
	<1291579960.7355.8.camel@matthew-laptop>
Date: Mon, 6 Dec 2010 08:02:22 +1030
Message-ID: <AANLkTik7tMZ1eXOmb741F892THAv-crQ3OisD587x+xc@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] wxwidgets: added libxinerama to DEPENDS
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
X-List-Received-Date: Sun, 05 Dec 2010 21:33:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 6 December 2010 06:42, Matthew Thompson <matthewbot@gmail.com> wrote:
> On Sun, 2010-12-05 at 17:13 +0100, Eric B=E9nard wrote:
>> Hi,
>>
>> On 05/12/2010 17:02, Matt Thompson wrote:
>> > Signed-off-by: Matt Thompson<matthewbot@gmail.com>
>> > ---
>> > =A0 recipes/wxwidgets/wxwidgets.inc | =A0 =A02 +-
>> > =A0 1 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/recipes/wxwidgets/wxwidgets.inc b/recipes/wxwidgets/wxwid=
gets.inc
>> > index 2fb2bef..4c4f77f 100644
>> > --- a/recipes/wxwidgets/wxwidgets.inc
>> > +++ b/recipes/wxwidgets/wxwidgets.inc
>> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "wxWidgets is a cross platform applica=
tion framework utilizing nat
>> > =A0 HOMEPAGE =3D "http://www.wxwidgets.org"
>> > =A0 SECTION =3D "x11/libs"
>> > =A0 LICENSE =3D "wxWindows"
>> > -DEPENDS =3D "gtk+ jpeg tiff libpng zlib expat"
>> > +DEPENDS =3D "gtk+ jpeg tiff libpng zlib expat libxinerama"
>> >
>> maybe this is obvious for wxwidgets'users but can you please add a comme=
nt
>> detailing why this is needed ?
>>
>> Thanks,
>> Eric
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I'm not entirely sure myself, but under the recipes fails to build
> wxwidgets without libxinerama on my box at least.
>
> I'm using the overo-oe branch of openembedded, but it appears as though
> they haven't made any changes to this recipe, so I sent the patch here.
> I'm also using their configuration files if that matters.
>
> This is my first time sending a patch via a mailing list, so should I
> amend my commit with an additional line in the commit message to the
> effect of "wxwidgets depends on libxinerama, which was missing from the
> recipe" and then perform git send-email again as detailed in the wiki?
> Is there some additional step to mark it as a revision to this patch?

If you include a snippet of the failure message then anyone else
encountering the problem will find your patch in the archives (which
is useful even after it gets applied).

-Graham


