Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 685B27DE8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 19:36:06 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r12so3194991edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2019 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4j+E+poNO8btG0/6O93JuMo69RFEg9gExox65THsw/8=;
	b=cPRt2A6g8uStnYMihPk4Y/FDenpsioRRRzUAPZvL7SqWPaUaH5BHzxObZvJ3vFxAPJ
	nnf6USyvEOiOVgdn7pt1SschO54/Tc+dDyH7Y/tTDIe4S6JBA19OMYrIE6o8OravCSTV
	ne1kq+Fm785kYgS4Vw8FSR6yK7RA9LjlZawcnewgQNKAtvaF7EP7OYiABxbNYVwwbnpQ
	btrg5yEsBcfBfmRG3PK+jwKOEdRp2+81USvApgx2PRHefMWFV+cfX4pXZ5wI91t7g2rz
	wXGRUrhBBaBOSNHIsyBDlaJxoZ4Dvbfe0tLF+fclNfk7ROP7x3iiETfktVYYuP2h2FMk
	yo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4j+E+poNO8btG0/6O93JuMo69RFEg9gExox65THsw/8=;
	b=TiOK7FtVwKSphtKi0wEcqQ2pX5mkXn6vXIfiSKS0G+YS1l699+4PRQ1atCwFnk9g3u
	GbFj6a2Sdk/bV4c0e+PBxawExovnlNu+9eDQ0VZ2jJ3nX8H6gN+l2S8O4hHgE22yWotr
	1uJ7vM0T8LtaTK9j+M0jBxS1SBlAsMU8Zs/fjrLOci1RoG6sKkTrq6jBErPviRPtqzci
	TjuWEwC2iz/kRttkO8yf+JO0PgrmZn0seIEUyCa04G6YgQpD8PP/SnUdsUAuwzyGmKGa
	B9dJKaI/au1Ir1tlwzTTnYJXuGRuV6vDmsbzjJIl7p6HIG8kqQuPpdJeg4CeSZyiwMHM
	+atQ==
X-Gm-Message-State: APjAAAX6qicuDp2ecmk2IapwsmBnUU/1dY9Q3wJ7hBIbF7ssLK7/7scd
	tkDSKLcD4iz/kRWfOC/vPoPHt49B14Ucd4m7h1g=
X-Google-Smtp-Source: APXvYqxAK/gOobGxXtQ0efL5U6ADulDty6c6A/9btrxmOmlZUjd1E/MboetyyTrDTLE417F1PV/mZ7W2tj1wkOF4qpY=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr44563229eda.98.1562182567057; 
	Wed, 03 Jul 2019 12:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <A2839490D87BE64781D1FF17AA14CEC30B9D7183@pgsmsx113.gar.corp.intel.com>
In-Reply-To: <A2839490D87BE64781D1FF17AA14CEC30B9D7183@pgsmsx113.gar.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 3 Jul 2019 21:35:55 +0200
Message-ID: <CA+chaQd4X1oUPYuhD1HA2g1y03Mik=uqreeRmxCR0ykD4JQZ6w@mail.gmail.com>
To: "Yong, Jonathan" <jonathan.yong@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Backport 'multiconfig' -> 'mc' patch to warrior?
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
X-List-Received-Date: Wed, 03 Jul 2019 19:36:06 -0000
Content-Type: text/plain; charset="UTF-8"

> The warrior branch is broken with bitbake master branch

This is unsupported combination, so it's not broken. Why don't you use
bitbake 1.42 which is compatible with warrior?

On Wed, Jul 3, 2019 at 6:21 PM Yong, Jonathan <jonathan.yong@intel.com>
wrote:

> Hi all,
>
> Can someone please backport the following patch from OE-Core master to
> warrior?
>
> commit 8a6f7c1e455156966f467008645fef14db679ccf
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Jun 7 13:45:17 2019 +0100
>
>     multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The warrior branch is broken with bitbake master branch, and I want to
> avoid needing to change all my local recipes when the time comes to upgrade
> to zeus.
> Thanks.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

