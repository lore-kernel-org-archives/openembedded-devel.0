Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1SgmWs-00030Y-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 02:42:46 +0200
Received: (qmail invoked by alias); 19 Jun 2012 00:32:04 -0000
Received: from unknown (EHLO pink.localnet) [78.96.83.205]
	by mail.gmx.net (mp004) with SMTP; 19 Jun 2012 02:32:04 +0200
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/xM4M3M93xXwG0ay6+MX4wA1ce53ysqacZdDyqkN
	tEydjaooqaHxGg
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 03:32:03 +0300
Message-ID: <7888297.NxAaM4fFbI@pink>
User-Agent: KMail/4.8.3 (Linux/3.2.12-gentoo; KDE/4.8.3; x86_64; ; )
In-Reply-To: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: Re: Package selection
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
X-List-Received-Date: Tue, 19 Jun 2012 00:42:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 18 June 2012 11:57:01 Dallas Clement wrote:
> Lastly, it is possible to avoid the repeated fetching of source
> packages?  In other words, can the source URI's point to packages in a
> local file system repository?

I have extracted some minimal code from the old OE srctree.bbclass file that 
allows us to do minimal rebuilds when developing:

S="/path/to/your/sources/"
SRC_URI=""

def remove_tasks(deltasks, d):
    for task in filter(lambda k: d.getVarFlag(k, "task"), d.keys()):
        deps = d.getVarFlag(task, "deps")
        for preptask in deltasks:
            if preptask in deps:
                deps.remove(preptask)
        d.setVarFlag(task, "deps", deps)

#addtask configure after do_setscene

python () {
    remove_tasks(["do_patch", "do_unpack", "do_fetch"], d)
}


Note that setting S there makes bitbake treat this as the work folder, so 
you'll get oe-core build artifacts there.

Also, you need to bitbake -c cleanall <your-package> to make bitbake forget it 
has already built your package, and next bitbake <your-package> to perform the 
minimal build.

> 
> Thanks much,
> 
> Dallas
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


