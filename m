Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id ACD7773BBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:12:51 +0000 (UTC)
Received: by wigg3 with SMTP id g3so110185545wig.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 07:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=CgCbhILKANCWwW80sMuX3SJU5kNJEUrho1lpqUWbd/A=;
	b=PTV0Owgf0zW8SjkA7nli6MRmxFl0Tpup63acQxg6eqIjWl2LKsxj4iu/oyVLlgpVeX
	wuHAAqTTHA5Akra8LvKI3SgfucoRJweECA2b+Fe0eXilknTDGtpSi+X8q/YIrgEzcC3P
	zQi0t2Ccmnm15FxFOEucOs7Ek2W0V7fLZUybdbaeCWrOdxVfzBNBCc4UOUx/zPe4v+O0
	Vke8+Pj5fBjQrnypB1NnPKZTFsBBxhS+rC/WUX2Zp1KAHsIgOHayTGJXYCg50KZO4Tzp
	iwR7ENNsFne4Pzx7XFvdGHCcTK9EfkAxkt5LQNvQ9Z9WckBciZpDTvZgChiRXckw/nzN
	rfWQ==
X-Gm-Message-State: ALoCoQn8N8mJnKajt1egztJ4qJY+FUdgZPCQHDuRe4RIadspqyD9wFL3RVyqW35yAatSqa1BP9mA
X-Received: by 10.180.20.198 with SMTP id p6mr7396265wie.38.1434463972142;
	Tue, 16 Jun 2015 07:12:52 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id ul1sm1854277wjc.30.2015.06.16.07.12.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 07:12:51 -0700 (PDT)
Message-ID: <55802EE1.6040703@dresearch-fe.de>
Date: Tue, 16 Jun 2015 16:12:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Tue, 16 Jun 2015 14:12:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

For development purposes we use this method to build always from the HEAD revision of a git repository.

-------------> snip <--------------
SRCREV="${AUTOREV}"
PV = "gitr${SRCPV}"

SRC_URI = "git://git@bitbucket.org/.../foo.git;protocol=ssh"
-------------> snap <--------------

Now we like to do the same in one recipe which uses sources from two git repos.

Our first try was this one. But if failed..

-------------> snip <--------------
SRCREV_foo="${AUTOREV_foo}"
SRCREV_bar="${AUTOREV_bar}"
PV = "gitr${SRCPV_foo}+${SRCPV_bar}"

SRC_URI = " \
	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
"
-------------> snap <--------------

Is it possible to do what we want? And what's the right way to do it?

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

