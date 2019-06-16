Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5757B7EBE2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 08:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45RS1y19zcz3k;
	Sun, 16 Jun 2019 10:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560673190;
	bh=s4hUDuR5vC8xnQHph+OdFHEep3kj9MJwteWK3GCA/+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgkJgfHts4+flHqqA0Pza8hMclE824dgvovboY7LZqUXEJ/p6zVFrWtnzl5GBkWDi
	l0Z+e9emtcWAidlVVS81JUcgdrua609w+gXEhwdpk9/W1SRqG/3/TzpHaQtoPpetXM
	vqqL2ilGvMcwllWyNVhDfuldnVB5wfxqP6HyK9cc+8IqcoiAQuj/FeofevMh2h5d2+
	1bylZpUT3sUTjHJXG61Bv4d/gybgBn8neSQycNNQdSbngaOndVkMGgz8wy/IxNSw+M
	7vEvkuFPNTcg+tSbHDQGuVgt2eA7pc4wpMNrepH0TXz4IJAZkBK0E7OC2MNXknLwft
	cTB3RWgwLNSUUgKgpehlCKgxCygkXhOIB1S+uSm9mmToQ6PFdTlvjSd+0CU2GTJfn/
	Lil9T3Sq3Fk17aid50no/utxNcOCGiLrsILS519Pjvk+XkYcHBfGKD7JPDXWXDBUoE
	1iBjmENzfbFlsMYC4qpYLsvcfpJBY9N3e4MrlAsrRh5l6DpcJWwNEzj5jRTXo6DVYm
	k1+oA6UhnjwWXB61e8ogCQoVRK9n1sXChIfAiRPhtWQEyIKlNSQIqwm3Wzi+znvPk5
	BMp3W+ahRiYNQUUK5e9M5DZbJnANi8Ztf6Tlr6EHKkEHN1QeByS0SBppVUUD1Gk7xq
	RNYR1oWhL1elIBw2hzyYouWg=
Date: Sun, 16 Jun 2019 11:19:48 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190616081948.GA2479@localhost>
References: <cover.1560620937.git.akuster808@gmail.com>
	<465a9b349cc3f1a68e23e5e522a3e6798c651b9e.1560620937.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <465a9b349cc3f1a68e23e5e522a3e6798c651b9e.1560620937.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Warror][ 12/23] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Sun, 16 Jun 2019 08:19:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Such an upgrade from the upstream master branch is not appropriate for 
a stable series.

Backporting fixes for 5.1 might be an option, the compile error that was 
posted to the mailing list has a trivial upstream fix.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


