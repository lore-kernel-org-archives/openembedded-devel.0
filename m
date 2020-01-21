Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7E47FD63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579597070; x=1611133070;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:content-transfer-encoding:in-reply-to;
	bh=WgvITKZdCLWAaTsEPsUMNih5j8XrI6q89z2b2CAqeqU=;
	b=ASB7Q25/c1fx6rIg/EmXgqwBpsYo7oWmjBjYW5lZ/a1waQEdY5f4qT2f
	ovtvWmV74lh6HvBjO3ij7/eo0LS0n5fKzfVSfnm9RK515ClLP+ysltLzT
	Wf7Yfv0V14ynsb07mGUef9qZ6ZGDrlx7ZVy+OHgOf16AnP6JBHBH4tpDI
	7ROjL/MvM5aHSnPodYuaD5WYSWR6IJV8NdAL9ityUh+D8JpKAV1SmTWhc
	cDNtsLq0fWYXZAGI3BhKvtDw2/5Z755bJrf0mxqtUlH/w44z4kuXSeafV
	gBj4CMNQg6QMkvJBFWWsb7tSZDZfnSubb+iP/WrOPGugMd0HVzPDe7veq Q==;
IronPort-SDR: pKXs+fwHtFNOeCnMWENapb0suWzyr3OstHbFJj7QlmdY8EdyuxKC/SnQ08HwYq++VfvCSwbkbC
	eMVAQ64c4GTDeMEc3AXQkeQprjh7gtPWnHkJT/nnPQy04qo+qDPXue7ZBFGQ3tT8h7qgtH4MzZ
	nmgxO6CFSHV0ZxtJBUHhAwxbV6a8KKRcR4fvXU++aP21p2t8bXta5qe8el2kizf8eWBt6IbrUR
	sQLv57blTuGgfzHW6ZAfzjUarcY6nol1pTN0/qctrRS24VTIQHWAT9LXIXd+4Uwvu9B6z/UPzn
	q1g=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; d="scan'208";a="22152329"
Date: Tue, 21 Jan 2020 09:57:49 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20200121085749.GA3709605@pcleri>
References: <20200120202815.58841-1-michael.davis@essvote.com>
	<20200121064438.GA1567918@pcleri>
	<bd94e91dbbfd01500f86432e1c30ee356bb85d12.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <bd94e91dbbfd01500f86432e1c30ee356bb85d12.camel@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] java.bbclass: oe_makeclasspath does nothing without -s
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
X-List-Received-Date: Tue, 21 Jan 2020 08:57:49 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 21, 2020 at 08:46:29AM +0000, André Draszik wrote:
> On Tue, 2020-01-21 at 07:44 +0100, Richard Leitner wrote:
> > Hi,
> > this is a note to let you know that I've just added this patch to the
> > master-next branch of the meta-java repository at
> >      git://git.yoctoproject.org/meta-java
> > 
> > As soon as it has gone through some more testing it will likely be
> > merged to the master branch.
> > 
> > If you have any questions, please let me know.
> > 
> > regards;Richard.L
> > 
> > On Mon, Jan 20, 2020 at 08:28:31PM +0000, Davis, Michael wrote:
> > > oe_makeclasspath is supposed to output for the target platform by default and the staging platform with -s.
> > > However it checks if the file exists even if -s is not defined which is always false.
> > > Additionaly remove comment around an error that never occurs.
> > > 
> > > Signed-off-by: Michael Davis <michael.davis@essvote.com>
> > > ---

...

> > > @@ -113,9 +113,9 @@ oe_makeclasspath() {
> > >            *)
> > >                file=$dir/$1.jar
> > >  
> > > -              if [ -e $file ]; then
> > > -                  classpath=$classpath$delimiter$file
> > > -                  delimiter=":"
> > > +              if [ $staging == false ] || [ -e $file ]; then
>                                  ^^
> Can you please remove this bashism. One '=' is enough.

Sure. Thanks for the catch.
I'll push an update to master-next in the next minutes.

> 
> Cheers,
> Andre'

regards;rl

