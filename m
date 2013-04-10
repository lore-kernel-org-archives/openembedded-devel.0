Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>) id 1UPvlq-0002C1-6f
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 16:13:10 +0200
Received: by mail-oa0-f50.google.com with SMTP id n1so457314oag.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=2nWTUyVRyEjANhazUFQEsqTg84e/l+QMgZSSzm17TBk=;
	b=uv4nMKpOuE7+AZebVX4e3tQmYLv0OBASPrucCRuxkylCo/Btg+MKa1SEe54MFEcZO/
	7iil7Z3LyFQke/yB+Ej7OAd1vpaVKqiWPyW55n8cPAPqkBXmT1dxwV0Ossu4VLqNhtix
	bNxCwPNmwa7INlw/oPHhRki+e5S/TbTV9r5lQU1jC66n1aBLxgUDcHYxfnYu9axO4g6P
	atW2gbKZqRw/7/O8LMto2K8LUkcuQcC3P9DKy9QnsGF4DmjXm1JXPd5LTHNvbKRDfdET
	jdNleUrBjuCSCYEyjOqnCGKDnqwTVgGKFB4KLieSDuN21T0JyWAt/gtHvznB3ws+7Gnq
	347g==
X-Received: by 10.182.102.106 with SMTP id fn10mr732653obb.85.1365602144239;
	Wed, 10 Apr 2013 06:55:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.34.39 with HTTP; Wed, 10 Apr 2013 06:55:24 -0700 (PDT)
In-Reply-To: <CAJTo0LZLF9JhAd_Eo3Hr5n2LxXxgGCD_D9K4=ZQ8cSjwvWL6Uw@mail.gmail.com>
References: <CAOT3miKm12uZ75LrH5fvRxrSvZ7wbyi+ioxMQgROsF3B-mJTvQ@mail.gmail.com>
	<CAJTo0LZLF9JhAd_Eo3Hr5n2LxXxgGCD_D9K4=ZQ8cSjwvWL6Uw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 10 Apr 2013 15:55:24 +0200
Message-ID: <CAOT3mi+U3J3rMeivpZv7_coMrdnKeKCG1BxskZvZyZhhmKMivA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: why does gupnp depends on gnome-icon-theme?
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
X-List-Received-Date: Wed, 10 Apr 2013 14:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 3:40 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> i have noticed that gupnp (in meta-multimedia/recipes-connectivity)
>> depends on gnome-icon-theme, and I don't really understand why, see
>>
>> http://cgit.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc#n5
>
> That's historical, the only dependency on g-i-t is in gupnp-tools.
> Patch welcome to remove it!

ok. thanks. will send shortly.

>
>> i was able to build an image with gupnp even after patching DEPENDS to
>> get rid of the dependency, and the main concern with this dependency
>> is that it brings:
>>
>> RRECOMMENDS_${PN} = "librsvg-gtk"
>> and as such attempts to build gtk+, while I am trying to make a
>> directfb image without GTK.
>
> That's also a bit annoying isn't it...  Maybe that should be removed
> generally, and we'll leave it to distros/products to decide/know
> whether they are using SVG icons or not.

i will not send this one, as i think more discussions might be
needed... and my initial issue is fixed with the first patch anyways.


