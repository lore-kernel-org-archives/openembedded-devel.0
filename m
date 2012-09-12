Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBolq-0000Ac-LD
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 17:22:30 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 08:09:56 -0700
Received: by obblz20 with SMTP id lz20so2811562obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 08:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=G6ILZftlh8dwnCfkjArm1xo6q3wmx2/nlLRygIx7FwM=;
	b=Dlqosn0DZHmn8dgx31ftLomjluSqfROh6apMH6kiP37eZz76qhZsNAGkH2cqxJz/7p
	BgL7xiQ533A5qNnBsEmKzt4mlkOh7nAbqjxmb7nlr+xHBKSN4XvFvpaBdCObnqCHKPQG
	iDNsnF3BDgmRJb9e09PJ1aGavWY0i/VjDKWTe3J0w0JevJJimUgDUP2TZH3wXjY5xunA
	J9xjNvmn1rQDOpQIQQPtwK0B+IIvQljJFe4FmPH0Cib/ay31bOvZtIgNVXamU5TdTkHU
	+4Ej7KuJpUI+jV1MoIPUyjJqiTtMrQUCO5W31jTjkGnzK3LsJdHNIQyTUzQHe+nCkg9G
	3idg==
Received: by 10.60.12.106 with SMTP id x10mr1802804oeb.103.1347462596199; Wed,
	12 Sep 2012 08:09:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 12 Sep 2012 08:09:33 -0700 (PDT)
In-Reply-To: <1347459798.11710.27.camel@ted>
References: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
	<1347459798.11710.27.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 16:09:33 +0100
Message-ID: <CAJTo0LbNPMkSZ7ftDkyKsbxbL50o7St5rj-FZaeiYuYDOv7Wbw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlC+/QMTs+GA30R7NFd30hPsU0ZZxTvuyp0vjP2IO7ajixdZ5TJp28FQOolOzUPMKRrzcdi
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: libx11-diet removal
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
X-List-Received-Date: Wed, 12 Sep 2012 15:22:30 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2012 15:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Is there any way to add in enough functionality that gtk/qt would work
> but still save some space?

The big piece that gets removed in diet is the Xlocale functionality -
this is what brings the size and the compatibility problems.

libX11 as it stands now is actually smaller than the old libX11-trim,
as some optional features in libX11 (Xcms, BigFont) are disabled by
default (packageconfig to turn them back on).

The important distinction is that libX11 is (practically) unpatched,
where as -diet is chopped up.

Ross


