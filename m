Received: from [85.115.60.190] (helo=cluster-d.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1Ljawy-0001WV-5s
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 16:11:37 +0100
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly49d.srv.mailcontrol.com (MailControl) with ESMTP id
	n2HF9uke029201
	for <openembedded-devel@openembedded.org>; Tue, 17 Mar 2009 15:10:42 GMT
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 17 Mar 2009 16:09:57 +0100
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Tue, 17 Mar 2009 16:09:56 +0100
Message-ID: <49BFBD42.7060902@mta.it>
Date: Tue, 17 Mar 2009 16:09:54 +0100
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903171538.21499.marcin@juszkiewicz.com.pl>
X-OriginalArrivalTime: 17 Mar 2009 15:09:57.0225 (UTC)
	FILETIME=[6F1DE590:01C9A712]
X-Scanned-By: MailControl A_08_51_00 (www.mailcontrol.com) on 10.68.0.159
X-SA-Exim-Connect-IP: 85.115.60.190
X-SA-Exim-Mail-From: Matteo.Fortini@mta.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,RDNS_NONE,SPF_HELO_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 15:11:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Just my 2c:
this definitely needs to be done not to shy away "professional" people 
who want to try OE: I personally tried angstrom + qpe with Angstrom on 
x86 and I got lots of problems straight from the beginning.

I mean that it'd be better to have only 3 images which are know to work, 
and all the rest which refuse to build, rather than show off that we can 
do this and that, and everything one tries resulting being broken.

Regards,
Matteo

Marcin Juszkiewicz ha scritto:
> Hi
>
> I know that there were lot of talks about creating stable branch of 
> OpenEmbedded in last months. But we need stable branch for vendors which 
> use our product.
>
> As some people know I am working for Bug Labs company. Their product 
> named 'BUG Linux' is based on Poky 'pinky' (last stable release). We 
> were considering switch to newer (but never released) version named 
> 'elroy' but recently we decided to switch to OpenEmbedded. 
>
> But to what kind of OE? Development branch change every day and things 
> break from time to time, packages get version bumps without notifying 
> anyone etc. Other possibility would be switch to stable branch but 
> current one is deprecated and not maintained anymore.
>
> So the situation looks like we will need new stable branch with few 
> maintainers (I will be one of them) and with proper policies for merging 
> updates from development tree of OE. I maintained OE branches used for 
> OpenZaurus/Familiar few years ago so can say that I have needed 
> experience for it.
>
> Which things needs defining? I have few in mind:
>
> 1. Adding new things. This should be possible only by backporting from
>    OE.dev tree and needs to be Acked by at least 2-3 developers which
>    use stable branch. New code has to build for at least one distro and
>    ARM+x86 architectures (unless it is related to one arch or even one 
>    machine).
>
> 2. Marking recipes as buildable or not. With over 6000 of them it is
>    really hard to check everything for status. We can remove many old
>    versions but sometimes they are useful for some projects. I would   
>    rather add things like BUILDABLE_armv4t = "1" into recipe or into
>    conf/distro/include/${DISTRO}-status.inc file. Similar status for
>    recipes which are known to not work for some archs.
>
> 3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete' 
>    dirs in metadata - both should be dropped in stable branch. Other
>    recipes can be marked as not buildable or dropped from branch - I did
>    not thought yet on it.
>
> 4. Lifetime of branch. Will we do new stable release after 6 months or
>    after one year? For how long stable branch will be supported by OE
>    itself? I know that there will be companies which will provide
>    support for longer time - thats what I do with Poky 'pinky' now.
>
> What do you feel about it? Any opinions or suggestions? Want to join 
> effort?
>
> Regards, 
>   




