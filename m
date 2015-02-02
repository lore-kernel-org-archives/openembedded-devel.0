Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFCC60017
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:51:07 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so30105202qal.7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TtsCqboOVxoCcvJ+3OEysKFuRTgOSWNbH/oesMbJP7g=;
	b=lywEmCMQuYX5CNE/fe928GyVVilhJFpWPk5i3m1JkmPThtsiUSQRj9Fy1GvDjXeqhc
	ntQEzPMb1u1gD/eIN4B9RWlA2NbbrecnIgU8fmM1PWosSIovIIVhG35exAJNHdSyiy2a
	2l4ZezC/d3mvWJVUv8doTW2Lid2NBCy+/bkKPgXENHYZ6RrP4dbbGpPRQhLlvaGAM0G5
	ZTd8Ht+iEU7ywhsuyI2csBIt8yMI37SjKxKJrJOMWWelcZ7wBJPkw6s+471jCK7f+enT
	Q17t39lDa9NUMq+pv+c8K/j/eMypoXpNHF1R3fYurOMVwqTvX6kAkDdGZTwADGAwwNH5
	fEFg==
X-Gm-Message-State: ALoCoQl62LQdlJB37ZQMF9vxW7ybboLn0LbV0SXcKGclMcWD5vVu5fbZ72h3btBJYWg3QUe4B1vW
X-Received: by 10.229.80.3 with SMTP id r3mr510379qck.23.1422899468596; Mon,
	02 Feb 2015 09:51:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:50:48 -0800 (PST)
In-Reply-To: <EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:50:48 +0000
Message-ID: <CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:51:14 -0000
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 17:40, Khem Raj <raj.khem@gmail.com> wrote:

> Yeah, you must be using a weirdly compiled gcc on your host which is
> defaulting to -std  < c99 and hence the problem. I have fix for that issue
> already locally.


$ gcc --version
gcc (Debian 4.7.2-5) 4.7.2

This is the default gcc in current Debian stable.

Ross

