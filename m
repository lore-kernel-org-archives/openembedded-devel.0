Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A48D26D8FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 16:19:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACGJcdv022540 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 16:19:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VqkHtiusMnfd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 16:19:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACGJZEa022528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 16:19:37 GMT
Message-ID: <1384273172.6460.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 16:19:32 +0000
In-Reply-To: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
References: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: how to populate sysroot with dev packages.
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
X-List-Received-Date: Tue, 12 Nov 2013 16:19:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 16:36 +0100, Anup Kini wrote:
> Hi All,
> 
> I am trying to build package-B which needs a few files from package-A-dev
> How do i deploy/install package-A-dev in sysroot such that when i build
> package-B it can access those files.
> 
> I know that i can install dev-pkgs in the image but i would like to know
> how to deploy them in the sysroot.

The act of building A should put its output into the sysroot. You'd
therefore just need a DEPENDS = "A" in recipe B.

Cheers,

Richard



