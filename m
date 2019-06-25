Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 433C97DD44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:44:22 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id a15so17227878qtn.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TM/AKzLOhipXpsI2KusLSlBxq3V3GV+n+UC+4LBjx5g=;
	b=AkUk824i9fVIcuu3gQE92POiFfSb5HRreKLpe3pUYlmb6LSUotUj11aF2f6ghaqZsg
	YjE73627s7ufui6YsA5Zu+HhwAttCWw5s3quQyy/vcyOhEuGlQqLs4Ud9WdHwwWk+bCl
	G/DXeEMdsvWww28n3W/VBXIouN/jTvWDnjNH1o3EFT6HC+YP6PZKgqj65DikiZ2gQ5ee
	56rqMnwbyFX0c/pyGPiLimXJ/xBFRd7dGUW+g/QrMYA17JsfIAMRua/UcuRp1GcEd4XF
	+qILqzgnH48l60xeq+ChijEHSV6h7TIpqWhti4g3x/p9yCT/rW/YOQmM3Z5eeb/RgoMG
	OaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TM/AKzLOhipXpsI2KusLSlBxq3V3GV+n+UC+4LBjx5g=;
	b=MiJlUoQHBzJRu69vJagDvAlo14V1V/+4+SrztFJ5CyCjxxo06UC79jAOeAyMyxeea2
	s1YRbVj5XWvNyb2I9N/fpiH/GCtE6ATd7A60JFyirpPlRYD2D4nXfwuD8VGs6YAm0jUW
	371h4m8QP7Ljd7Humh6J09XD2XJxhWRl5yZs4DP1tzXJw7PDqnywsDnElrhIT91eiOwg
	1pCI+Vi166/YJagtnr1VB+mbPi4UrCrd6aRvYU+gS/Yvhfs1zYAWce5Ng4sIY7H4foSd
	3ANYFroS5PF8r1ZrxmLEtn4yhc6+f3HkWf2MOlKTj1KTvQkzOti5otPdSacl286YqfFv
	RH8g==
X-Gm-Message-State: APjAAAV7I8fDcMOjco9Qj0a98E/Pp2UCO0NYxasy68MsgTI5cvybbfU2
	YWbuHGL2k28zaENEIffEOy78wjM8zWTb7l2uReQ=
X-Google-Smtp-Source: APXvYqyyDBGyayV3RAKNH0FRg5UK6d9pGZjuJZ6LS10Pih83gTwq33serN54akRPms9kafQcMS34Xfe/6kuDDft/l6g=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr131435470qtx.194.1561445062831;
	Mon, 24 Jun 2019 23:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <aae96935-730b-f67d-71c1-322c88d7d209@windriver.com>
In-Reply-To: <aae96935-730b-f67d-71c1-322c88d7d209@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jun 2019 23:43:56 -0700
Message-ID: <CAMKF1spcewqHtRuZNN2LTF3W0KY5ZSqbXLUCCYhL2ty=1juu0w@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: mongodb and itstool depend on meta-python
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 06:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 11:36 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Hi,
>
> Ideally, the meta-oe should not depend on other layers except oe-core
> layer. But I found there are 2 recipes mongodb and itstool in this layer
> depend on some python packages in meta-python layer:
>
> ERROR: Nothing PROVIDES 'python-pyyaml-native' (but
> /buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> DEPENDS on or otherwise requires it).
> ERROR: Nothing PROVIDES 'python-cheetah-native' (but
> /buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> DEPENDS on or otherwise requires it).
> ERROR: Nothing PROVIDES 'python-typing-native' (but
> /buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> DEPENDS on or otherwise requires it).
> ERROR: Nothing PROVIDES 'python3-lxml-native' (but
> /buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> DEPENDS on or otherwise requires it).
>
> Should we move these python recipes from meta-python to meta-oe?
>

actually oe-core would be better location for them since they are
being used in more than 1 recipes

> Regards,
> Yi
>

