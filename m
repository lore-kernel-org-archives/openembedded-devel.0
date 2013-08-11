Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7B17B61013
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 07:35:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7B7koFk018391 for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 08:46:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qunTQZiVXCrY
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 08:46:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7B7khgp018383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 08:46:45 +0100
Message-ID: <1376206543.27470.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2013 08:35:43 +0100
In-Reply-To: <alpine.DEB.2.02.1308091242270.18531@oneiric>
References: <alpine.DEB.2.02.1308091242270.18531@oneiric>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: what sources are *not* fetched by a "-c fetchall"?
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
X-List-Received-Date: Sun, 11 Aug 2013 07:35:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-09 at 12:46 -0400, Robert P. J. Day wrote:
>   currently testing a build for my beaglebone black using the meta-ti
> layer and, as i am wont to do, i did a:
> 
>   $ bitbake -c fetchall core-image-minimal
> 
> to (allegedly) fetch everything i would need for such a build.
> 
>   at that point, i did:
> 
>   $ bitbake core-image-minimal
> 
> and while this is running, i can see more source tarballs being pulled
> into the downloads directory -- examples:
> 
>   * file-5.13.tar.gz
>   * icu4c-50_1_2-src.tgz
>   * mklibs_0.1.34.tar.gz
>   * pcre-8.32.tar.bz2
> 
> and perhaps more since the build is not yet done.
> 
>   what is it about these particular packages that doesn't fall under
> the regular fetching from "-c fetchall"?

Which version of bitbake and the metadata was this with? There were some
issues fixed in that area fairly recently if I remember rightly.

Cheers,

Richard


