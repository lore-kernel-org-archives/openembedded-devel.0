Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U60HY-00014j-67
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 15:59:29 +0100
Received: by mail-vc0-f176.google.com with SMTP id fk10so1495824vcb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 06:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=vjGh8lN4P5/kwFS+H+D+gveth6LQwKmbQ0AVoS7Iowk=;
	b=JjtUisXwx9jSU3b6aG1Ph+yOKzhMG4ltSNJo0QqQlAidpuXoj1LZVBrTNmIbmmPTgk
	sSRFyh5/sJoNNijYJuQ66vyVijFmTsQX3ORKlaVembZFt71eUTASJQOIgerC9lcG2w7y
	dXzOMY90ck4Pv/20bglQnS/b4ZcxYnJy+NeuXA1CD1yWUjNrQseV5WnjvUcP3y8GKc2L
	NvVqcrjW1VYDpoj2PL+0s1KIVeo285Q53AeruWoLMxoNHya7UlxfQnfNVJwfTBRW4v77
	NnXv/BTg9+6A1OInr+lBaLHHhE1GZ+bNucRKQ4IMhUp+FJKmvjdwcKl7TX3M7y/z6Nom
	wicg==
X-Received: by 10.52.19.65 with SMTP id c1mr30252853vde.36.1360853005529; Thu,
	14 Feb 2013 06:43:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 06:43:05 -0800 (PST)
In-Reply-To: <CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 14:43:05 +0000
Message-ID: <CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlFo6S0eT2mdLlJVLBBfdwtb06FPwiYze6JDQw84IMgwx7v1wkAp88dfTkBMeyY/REJoVVZ
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Thu, 14 Feb 2013 14:59:29 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 10:32, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
> ERROR: There is a confusing multiline, partially commented expression on
> line 45 of file /home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
> angstrom-lxde-image.bb ().
> Please clarify whether this is all a comment or should be parsed.

This means that there is a confusing multiline comment on line 45.
This normally means this:

# this is a comment \

The trailing slash is ambiguous, so remove it.

Ross


