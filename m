Return-Path: <prvs=285b569e5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC987FCE6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579862272; x=1611398272;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=/xzYuZGywjnWmRMS6JWFPqF2HXPLU5gXoiNCUmTExlM=;
	b=tDrhYQRGBDKlFpUbnN9mdXXbL18PYpBEM3gyafMRgGPgXOUaukDZMZmC
	8w5fgXsBnxTof7hCkF3jg7sJyL7jHiIrH/+pbN5FXNPBSmZx9L+JpNoBn
	5SbKlkVjoYqZ2zZ77jJvDFOde21GTvjz8xYu2CMzgb/6wzlLU33JmmCNs
	eAFpq8wgY5BsIsCiZKXIJlC7dITfnS753+ocaondg/zR+BUZk9jQJy/YY
	cHvKGYCUl+HKVinBjwuOdQ10odcfmcLuufjMhllc05vp5FoZ8He3DCqNa
	THc+P4csYmFYFchsnAKnsyF9NTAjkLJxL/wI0nyLXRXYpNczs08s+kjHi Q==;
IronPort-SDR: CdseS1edvA8OeEFcvhCy97x5BMXK/E0qKphlC1udg0h/wg7NEoeA3lly0Lh90gRjwfOl+5q6AI
	snKneAk3PD+/cgJKeJsIzaaZawRx0r7h7DzEN/wXZPbgJYkaigGfcWNff3T/XiQMXtm+A8fNTW
	dwo/NakKpkaN3Z9alxM/3a8om7O8NtdXkbhPYS+vVgdaezBRaQcEtNZgbeKletmGbcEkb45xMn
	0BpDXzp9HMnGx5vMkx9/y1mJ1HqEXNZ81qjEdb2s/J0ygTAYn9Ki/rhNiy5SmeoLWhUNI8y96G
	Ybk=
X-IronPort-AV: E=Sophos;i="5.70,357,1574118000"; d="scan'208";a="22235197"
Date: Fri, 24 Jan 2020 11:37:49 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200124103621.GA10765@brokenbit>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Fri, 24 Jan 2020 10:37:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jacob,

On Tue, Jan 21, 2020 at 09:01:01AM +0100, Jacob Kroon wrote:
> On 1/21/20 8:12 AM, Richard Leitner wrote:
> > On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:
> > > Hi Richard,
> > > 
> > > I still can't use openjre-8 in either warrior, zeus or master builds, due to
> > > the crash below. I wonder, is anyone successfully using openjre-8 in either
> > > of these releases ?
> > 
> > I'm doing tests for the machine/distro combinations stated in the README
> > before pushing to master. Therefore it should have worked back then.
> > 
> > Nonetheless I'm currently working on updating openjdk-8 to the latest ga
> > and implementing continous (e.g. nightly/weekly) builds/tests on qemu to
> > make sure nothing broke over time.
> > 
> > So maybe I could get something out of this.
> > 
> 
> Thanks for doing this work.

I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
the meta-java repository [1]. It contains (as you might have guessed)
the update to openjdk 8u242ga.

Can you please give it a try if it works for you?

Please note that I might force-push to the branch.

regards;rl

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/log/?h=g0hl1n/wip-jdk8u242ga

