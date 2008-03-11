Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JZ3vY-0003wv-Nr
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:50:06 +0100
Received: from [172.16.23.102] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1JZ3tQ-0005in-CY for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 20:47:57 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JZ3tK-000718-Qb
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 20:47:38 +0800
Date: Tue, 11 Mar 2008 20:47:38 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311124738.GG26297@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org> <47D64717.3050804@gmail.com>
	<20080311113256.461ad5d1@widy.localdomain>
	<200803111045.12166.zecke@selfish.org>
	<20080311120056.748ec358@widy.localdomain>
	<20080311101433.77a09fd2@cimmeria> <fr5neg$l26$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <fr5neg$l26$1@ger.gmane.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 124.219.5.209
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 12:50:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2008 at 11:38:07AM +0100, Koen Kooi wrote:
> 
> The q&d way:
> 
> * create a local diff by editing or adding a file
> * commit -b org.openmoko.needmorebru
> * checkout the branch into a new dir: mtn co -b org.openmoko.needmorebru
> * go wild in that branch
> * track .dev: mtn propagate org.openembedded.dev org.openmoko.needmorebru

That's what I'm considering to do now.  But I have the following problem:

> and once the stuff reached a good QA point:
> 
> mtn propagate org.openmoko.needmorebru org.openembedded.dev

Most of the time I cannot do that.  There are stuffs not appropriate
for OE.dev in OM, and I suspect there will always be.  However, I have
to push my fixes upstream.  If I didn't do that and someone else did,
it's unnecessary effort plus I will need to manually merge it next
time I sync.

So, I can only pluck.  However, next time when I propagate from OE.dev
to OM, very likely I will get conflicts.

What we're trying to do is having a branch with local changes but
always following the master branch OE.dev.  I think mtn is not very
satisfying in this situation.


Regards,
John


