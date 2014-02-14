Return-Path: <sander@outrightsolutions.nl>
Received: from mail.outrightsolutions.nl (outrightsolutions.nl
	[194.145.201.26])
	by mail.openembedded.org (Postfix) with ESMTP id D7E8C6E4CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 23EA46F41D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:46:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id EYv311-jJ93d
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:46:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 520436F41C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:46:13 +0100 (CET)
User-Agent: SOGoMail 2.1.1b
X-Forward: 145.72.98.1
MIME-Version: 1.0
from: "Sander van Grieken" <sander@outrightsolutions.nl>
message-id: <5ea7-52fe1000-9-6cdb4f00@50057099>
to: openembedded-devel@lists.openembedded.org
date: Fri, 14 Feb 2014 13:46:13 +0100
in-reply-to: <52FCFA41.5050002@balister.org>
Subject: Re: OE and SSDs
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
X-List-Received-Date: Fri, 14 Feb 2014 12:46:15 -0000
content-type: text/plain; charset="utf-8"
content-transfer-encoding: 7bit

 
On Thursday, February 13, 2014 18:00 CET, Philip Balister <philip@balister.org> wrote: 
> On 02/13/2014 05:38 AM, Carlos Rafael Giani wrote:
> > Hello,
> > 
> > we are considering purchasing SSDs for our development machines, for
> > faster I/O and better latency. One open question is whether to buy TLC-
> > or MLC-based drives. TLCs are considerably cheaper. They would not be
> > used in build bots, but on the other hand, people will build entire
> > images with OE by themselves during development.
> > 
> > So I wonder about the impact on the drive's lifespan, and whether or not
> > it is severe enough to warrant the more expensive MLC drives (up to 2
> > times more expensive).
> > 
> > Did anybody made experiences with these? Any recommendations?
> 
> A lot of people use as much ram as they can fit in the box and use
> tmpfs'. You might try that approach first.

It might be interesting to in some way integrate this behaviour automatically, if an FS-on-SSD is detected and plenty of RAM is present. For instance, if INHERIT+="rm_work" is set, the build directory could be automatically overlayed using aufs/unionfs, since the intermediate result in the build directory is then by definition irrelevant after a succesful build.

I have no idea though, what the minimum amount of free memory would need to be to be sure that none of the bigger builds fail. 

Regards,
Sander




