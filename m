Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 54E986E687
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:20:12 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so422689499pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=gdVLymAfNTRiraGZLoCDUh4lPQ9H63ambD+ypDHGevI=;
	b=z6CqCWE05RfUOWb6bDtJR6f1iXqyCrkKI51NZctR4sI+l6kx4hgTkRfl8Q1Y6sii50
	ve8RbuEbrq47jaeEc0kUs9WX32CkSQqUpxQ30t9HzWTF6GmT9XTVzjanc1kxaXF0hLaD
	Wyec2dITsaDivfh8Mg9/ZNfFps1iiWkmNRRpYDbpYlVpzNuw8q2Yu3k6gAWI/9O1PRTw
	pHcx0JcUKwFKrh7qCG/fLsGm1+JLUhS06VB7O3b2qsyj5uk5i+czXb8AlyyF76GzCDo8
	tbCZfIHKgz02vbvP2ERR0ErLfWQJV80NZ87PcX1j2+erEEeXf+w1EirBvc9eTcNw+d0W
	LXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=gdVLymAfNTRiraGZLoCDUh4lPQ9H63ambD+ypDHGevI=;
	b=VztnvYJq0OO/NbXwdQ5iKPgoWCRuu2lwfg4pK+wRXI25l0GbCj5G5eHZ79nARzyhWC
	BdDq/eXHm+kv52WuBgA2azmpXr0g/4n03fB4Y7pFkijQCHt4nbRJ4J/RpuPbP12lOiZW
	7oN78FRZlJv89s4D1X+s3Ftu2qkDBmTE8W5G2G2bM/Jv1TvDLIG+dQsjfJUgj0SmQx+g
	dq4J3MbouOivyMln92GZbmP8gntJXlIubE0IdP8QzGHSqO/waBIsVaPdCOtCFMUKL1ej
	driNFdwPCrvPvGGfgv1tWU1b64HK0+7SX5aTC7LzA4M9Awq0N0SP0uTqGFdW5lVuvirb
	Wqfw==
X-Gm-Message-State: ALoCoQmv3gR+jEwoWHV4YtxtHJp/4RNwnPeb6UsL1RBc1rSfEpR/1ZaZYNYGF5GzOczLFLWLJ4DI5Q4KjhDhcPeiEOHUuXTZ8g==
X-Received: by 10.66.252.198 with SMTP id zu6mr38246676pac.107.1453137613574; 
	Mon, 18 Jan 2016 09:20:13 -0800 (PST)
Received: from mail.spox.systems
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	o67sm35319518pfa.58.2016.01.18.09.20.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 09:20:12 -0800 (PST)
Date: Mon, 18 Jan 2016 09:19:34 -0800
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160118171933.GA28347@mail.spox.systems>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Require backport of patch to jethro branch
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
X-List-Received-Date: Mon, 18 Jan 2016 17:20:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'd like to backport this patch to jethro:

http://cgit.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb?id=9546714d2464b950e91d0eaf330865e482450113

Without this samba does not install init scripts correctly when using
sysvinit.

Does anyone see any problems with this?

