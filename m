Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5833B605BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:56:02 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so1690129vka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=fPj9I9d5V6pNJFLdjI5MtW1/8S1SMihrmlM2OvoZbUM=;
	b=bmGGs/uXqcIBoMh8D7ZhWb6gSS24cu6RctikdxIfy22BRdoMG3uHncUTbsPISUZC+o
	//Z7MMiniQxXrb3qiUybWVOvenw6b7e6tW78osPCADg3hqYNB/G5N8E2g38F0BN8+mbo
	5PQ41XjTwzafPSIgy3OAqHOVvYV2h8YB+5DUEFC0wx/ZhrnVTLlLkHqJdjaYJX3N8uvm
	kHeYGK84/XMz2/rGVOhhkQF/nXKaoTq5jkaslcJjbRr66MdFHIfQChNi/F0S3hf5qdUy
	wV22GYKF+VVzZ+0jfkcEdadiQVQP/arttapEEidFZXmkTQYOzEzdzaGmib5VRBm4jqYP
	6Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=fPj9I9d5V6pNJFLdjI5MtW1/8S1SMihrmlM2OvoZbUM=;
	b=RzJf5xmXhWADOJmsiihqzA7pv/cHbWaMlGdAj/KXRB9KMzsE6fRdZwRfTvZekLrI4G
	nclElDBugHr+suMkyn9BSAVbPswDnU3ZTS6elTylIIO3D+suZLWcP7oSGpD3vXIq/7xf
	TCBvFtjj45YLYVF+cH1hs/5ZhyfW0aCVsnEa6EUxpI6xDb5sKqta9AHVOEfHTpjWsKPH
	ORCrX575JCb3fdYn5XzSwaq25bCHtMK+DabZILc2efe8sRxiXrgwSvxqt9OT0Q24MXEV
	lOZvKKOt5WobAALjC+JZQjzePbyoeKFdNnfUW8xTMcoP7C+t0VL4lE5qjkzuHB+tV++5
	nCMg==
X-Gm-Message-State: AOPr4FVDYWyS2afXlIi2VzoQErATXynrPgcHJqMbgaWPq73htAjUMFgzmtwymiXA0sGTeeSuvajNbBwMaoL2/Q==
MIME-Version: 1.0
X-Received: by 10.176.1.200 with SMTP id 66mr1269567ual.52.1460458562937; Tue,
	12 Apr 2016 03:56:02 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Tue, 12 Apr 2016 03:56:02 -0700 (PDT)
In-Reply-To: <20160412102200.GD2564@jama>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
	<20160412102200.GD2564@jama>
Date: Tue, 12 Apr 2016 12:56:02 +0200
Message-ID: <CALbNGRQHekxMgsVgQnT8ACK7pKiSTGJ1KRmNLyvH7rsZ=9Zz8w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 01/31] qtbase-native: update sources to 5.6.0
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
X-List-Received-Date: Tue, 12 Apr 2016 10:56:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Sun, Apr 10, 2016 at 09:41:00PM +0200, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> How did you pick these SRCREVs?
If tag for 5.6.0 available: I picked versions tagged.
If tag not available I chose revision right before 5.6.1 (as qtqick1)
out of 5.6 tree.
>
> OE @ ~/projects/qt-project/qtbase $ git log --oneline 41706400f605524a5a9=
953714aa0cfbf811dba7e..d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b
> d0cdc7a DirectFB: Fix build in C++98 mode
> 3bcc3037 fix non-git non-prefix shadow builds
> ae2d11d Add changelog for 5.6.0
> 38944d6 Fix syncqt.pl not respecting #pragma qt_no_master_include in file=
s with Windows line endings
> 469e293 Fix crash when a standard bus isn't available
> bcdcde0 Doc: Simple CSS style: Convert font-sizes from px to pt
> 719623a Fix builds without session management.
> e7bf0ed Add option to disable "session management by closing windows".
>
>
> It's actually missing some changes which were included in previous SRCREV=
, I usually use latest in e.g. 5.6 branch
> even when it sets the version for next release (e.g. 5.6.1).
I was not aware of that. So we'll have to wait for 5.6.1 (whenever it
appears) if we want released versions without going backwards.

As already noted in V2 description: Version mix 5.6.0/5.6.1 causes
cmake trouble and as heavy user of cmake in meta-qt5-extra I would
like to avoid...

Andreas

