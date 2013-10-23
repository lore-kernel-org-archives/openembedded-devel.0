Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 37FCD6CF07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 21:13:45 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id el20so1174578lab.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=/5DcUFvuburyHDDvrf8GfCvljNCYv+TWmMLdNMtPUOo=;
	b=ZrBD4tMibtkgOy32p7Dp4HXnLs13W9a+3MGYlVV7SBdbHx908U4OjuMTouk1NFUgdm
	LtCqHMu1B+xmx9UbTig9nvYAEnB7L7KkI9imMYjOaEmZXYBF8yRfBOS6swz3G13j9vZG
	/uzgWSLOkXBJXbeVKn/ST1VME8mlKgiPg7sPQB+ixHSSooorrD3Y5epALYHS9EAWCu5S
	kyoKbnnJnNvovjxaj+x2qdpO2VnQNUzzqb5BtnqYb6Wq/id6ZfsrQlbgwjWLgPeCYxT6
	TUBQ68BIzmMKHyKj8siaKu34KRgW5lhTCRF93Tb2tnmGb/MgAD+7l3WbB1fVKXfmC0TO
	jMJw==
X-Received: by 10.112.29.196 with SMTP id m4mr20022lbh.66.1382562826033; Wed,
	23 Oct 2013 14:13:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Wed, 23 Oct 2013 14:13:25 -0700 (PDT)
In-Reply-To: <CAP71WjzaQ__sPGsNxEG04yfPgnW+ZdGMN1HMSZzOje5SKhWXVw@mail.gmail.com>
References: <CAP71WjzaQ__sPGsNxEG04yfPgnW+ZdGMN1HMSZzOje5SKhWXVw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 23 Oct 2013 14:13:25 -0700
X-Google-Sender-Auth: r890ecFgoE5CU1YOZbtdbSZXNdw
Message-ID: <CABcZAN=06sHdQaNctAOr_LqawHYptK3c2vD3xvyV+ybHFBXB_A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: differences between target and native configure options
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
X-List-Received-Date: Wed, 23 Oct 2013 21:13:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 2:04 PM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> i have a recipe that is both used for target and for native. I need to
> have different configure options when it's built for target as opposed
> to native.
>
> earlier today on IRC, ericben showed me
>
> EXTRA_OEMAKE_virtclass-native =3D "what you want"
>
> However i now realize i need the exact opposite, i need to specify an
> option only when building the 'target', not native.
>
> iirc, virtclass is for native, or multilib... so is there another
> mechanism to do what i need?
>

EXTRA_OEMAKE_class-target =3D =E2=80=9C"
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

