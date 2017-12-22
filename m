Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id AC9C6788A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 07:55:36 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id o2so27168511wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 23:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=anH66ambFn6SpVFOT4/f5hseTDxzcSm2efe85++leKw=;
	b=Q4ngT+qfJ3Y+9rxEjSsw20eUvOGBTpHav9BqmtDfOEham5tokKIuOH6g1YzAMeZ9qt
	La3w9s5co4OTtL/u0mguDrHfkiDAMl1UEVnMQbD/00WO4DmNCjxiHOX094lW683akYPn
	x/o3eVYDN5q68qqjwzxFeS1AKs37QHr3I5Jaz+w23NhuLcSMt/zr6IN/wQOEsYCCK7OH
	3ROccYoHTDtzHO8yZpiBuVokgWUC4wKKsPH1g5rOLbsVvt89x9Dd/J6zZ8KRXYDn1/9z
	GZv56qA4LNW/Mkzy74kmG0qR3QTXeh/JZ6TOcqlL3Dst9Xq5XqgoRgRXnVOHrke6a8h8
	VEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=anH66ambFn6SpVFOT4/f5hseTDxzcSm2efe85++leKw=;
	b=mFkNw6PA815dLW1T/wdRkCf65aNSHTP297iC3W5m3rJY2nSmM52f7Xuet0wyBS7LFi
	2X5Dj1IgzJjk8r7jfVJYo2656g5skVExRositjgdn9AM1g6MZcqBfn57WF09WyrD4/vV
	tZvpMUcrOV1c/hQ6D1jGHz4Zi7VV3X2r0uE83YYYH8B5B2nX9t/Ndp2Sjm/Ki021Wwz0
	Xf/WZPygWOwcgVJmN9JYXx/KZ3RCtZHtIA4Mba6jPMhfIUi6xy545g5HfK/q3pdEKCFh
	SCKmrg8GoYpNJOlh7w+lZNqUL3RyF7KsdCg8dZmIu0DqOD5B3Y/HO0t0P3NvL4Nn7l04
	W/cg==
X-Gm-Message-State: AKGB3mIQDplibFXH08KoWc11THrLiMGOhWI5ZQjkdm3QMJAFkJ+RZH3r
	9qIMQkqJthagNEYTBg2EUxC89MTqsPz6r+JVw/027g==
X-Google-Smtp-Source: ACJfBovGaJrs8JPuwP03RlDFM75bN+70DnyiYq8apEjyYc6Lnaf4s197knebz1L+T3FJ5EOqy4NA1Ncd3ftyKjDE8uI=
X-Received: by 10.223.177.150 with SMTP id q22mr13968250wra.87.1513929337144; 
	Thu, 21 Dec 2017 23:55:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.162.211 with HTTP; Thu, 21 Dec 2017 23:55:36 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Fri, 22 Dec 2017 08:55:36 +0100
Message-ID: <CAPbeDCmTsCfrCAya_XQhN+Y5tKW7QnHQjeQThh6iT5ecneLEsw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] pyro, rocko and per-recipe sysroots
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
X-List-Received-Date: Fri, 22 Dec 2017 07:55:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to get a recent yocto build together with meta-java up and
running, but ran into some problems:

1. For rocko, I don't see the corresponding branch in meta-java,
should I use "master" ?
2. For pyro, there is a branch in meta-java, but the build fails
unless I backport the patch in commit
c4b9b97c7c60ad5c0c3392ccf143b2e4e6c7df24:

"java-library.bbclass: compatibility with per-recipe sysroots"

Could we get this patch officially backported to pyro ?

Thanks
Jacob

