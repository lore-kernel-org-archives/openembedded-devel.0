Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JeuY0-0001i7-Fh
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 17:01:48 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JeuXx-0002im-Eq
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 16:01:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 16:01:45 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 16:01:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 27 Mar 2008 17:01:34 +0100
Message-ID: <fsggcu$5i8$1@ger.gmane.org>
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270349.59619.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803270349.59619.zecke@selfish.org>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 16:01:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| On Thursday 27 March 2008 01:32:29 Graeme Gregory wrote:
|> Moving a private discussion public I started to add a quick score
card for
|> SCM's
|>
|> This is currently how I see feature support.
|>
|> So far we seem to have this list where goodness is 1-5 (5 being good)
|>
|> CPU Load Git 5 Monotone 3
|> Ease of branching Git 5 Monotone 5
|> Ease of Branch Merging Git 4 Monotone 3
|> Ease of Serving Git 1 Monotone 5
|> Ease of Distributed SCM Git 2 Monotone 5
|>
|>
|> Im sure there is more scores we can add to this list. And you might not
|> agree with my scores, but it seems pretty close so far.
|
| Ease of publishing branches Git 5 Monotone 0:
| 	Reasoning:
| 		With git, I push and transfer the number of bytes that I have changed
| 		to the server. So a small change is a small upload.
|
| 		With mtn (0.37 here) in contrast it wants to upload every revision
to the
| 		server. I'm on a GPRS/UMTS/CDMA line and after ~48MB of upload I got
| 		disconnected, twice. The revs still reside on my disk only, I'm not able
| 		to share it. The database is locked during this operation, I can not do
| 		diffs, commits, checkouts during this time.
|
| 		Publishing means uploading what we have created, which is a lot
bigger than
| 		just my small change.
|

That's because you used the wrong branch include pattern when pushing,
you did:

~  mtn push host org.foo.zecke1

you want:

~  mtn push host org.foo.{original,zecke1}

the second will only transfer new revs, instead of marking all revs with
the new branch cert and (re)transferring them.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH68TeMkyGM64RGpERAkRrAJ9/ZSoJcXU7RZ0SbxFkOipn3UK7uQCffULq
StJJ+msJRiaQLVBwCyR6PEE=
=DX14
-----END PGP SIGNATURE-----



