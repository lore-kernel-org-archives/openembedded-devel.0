Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1H31vs-0005WO-S3
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 04:09:21 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 79310D430F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2007 14:07:55 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31049-08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 6 Jan 2007 14:07:53 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 9D5C0D430E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2007 14:07:53 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 87D03163D445; Sat,  6 Jan 2007 14:07:53 +1100 (EST)
Date: Sat, 6 Jan 2007 14:07:53 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070106030753.GA17260@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <20061229001129.GA5501@hezmatt.org>
	<1167394324.5616.20.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1167394324.5616.20.camel@localhost.localdomain>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: What's with the symlinks?
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
X-List-Received-Date: Sat, 06 Jan 2007 03:09:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 29, 2006 at 12:12:03PM +0000, Richard Purdie wrote:
> On Fri, 2006-12-29 at 11:11 +1100, Matthew Palmer wrote:
> > Everywhere I go while assembling my OE build tree, I see admonishments not
> > to use a path that has symlinks in it.  For such a major problem, the only
> > real information on the actual problem is a fairly cryptic entry in the FAQ,
> > about a failure to build libtool-native.
> > 
> > Being an intensely curious kind of person, and not enjoying arbitrary
> > limits, I'm very interested to know what the *real* reason behind being so
> > strongly against the much-maligned symlink.  Can anyone enlighten me?
> 
> People have explained the reason but you can use paths with symlinks in
> *if* you're careful. Basically, you need to ensure the environmental

It's also possible to use bind mounts, which lets you mount one
subdirectory over another subdirectory, to achieve a similiar sort of
effect. I have my oe stuff in ~/devel/oe which is a bind mount from a
seperate disk:

  [nynaeve][ 2:02PM]~/devel/oe%> df -h .
  Filesystem            Size  Used Avail Use% Mounted on
  /u/5QF1E359/oe        294G   69G  226G  24% /home/lenehan/devel/oe
  [nynaeve][ 2:02PM]~/devel/oe%> cat /etc/fstab | grep oe
  /u/5QF1E359/oe          /home/lenehan/devel/oe  none    bind            0 0
  [nynaeve][ 2:04PM]~/devel/oe%> mount | grep 5QF1E359
  /dev/sdc2 on /u/5QF1E359 type ext3 (rw)
  /u/5QF1E359/oe on /home/lenehan/devel/oe type none (rw,bind)

So instead of a symlink from ~/devel/oe to /u/5QF1E359/oe I mounted (via a
bind mount) /u/5QF1E359/oe on ~/devel/oe

-- 
 Jamie Lenehan <lenehan@twibble.org>


