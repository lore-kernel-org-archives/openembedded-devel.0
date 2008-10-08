Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KnS1a-0002JK-Nn
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 07:55:54 +0200
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KnRx8-0001VP-5j
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 07:51:18 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Oct 2008 07:51:15 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810080751.15817.zecke@selfish.org>
Subject: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 05:55:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hey,

we would like to switch to git by next wednesday. Jan L=FCbbe went through =
the=20
hassle to fix two issues in my mtn2git.py and we are happy with the metadat=
a=20
and can even unite it with the data exported from bitkeeper.

The plans would be:
	- Send your public ssh keys if you have not done so

Tuesday:
	- Set monotone readonly 16h german time
	- merge the multiple heads (if they exist)
	- Try to add the revs from now to tuesday to git

Wednesday:
	- Be back up with git and use that as primary system.
	- Disable monotone completely


Things to note:
	The history will be different from the trial. You will need to=20
git-rebase --from trial-head --to official-head or just git-reset to get to=
=20
the official head.

Thanks to Jan for wrestling with monotone, git, the script and the data and=
 we=20
will keep you informed about how the migration is going.

comments

z.



