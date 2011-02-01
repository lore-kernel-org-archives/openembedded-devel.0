Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PkPSi-0005p6-J1
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 00:16:40 +0100
Received: by fxm17 with SMTP id 17so7458620fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 15:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=R0mfMvCqa6e0d6LigJ6WCDeU88MHxdv0fpps5/olrhE=;
	b=AJm9WGC5hm0TxPL9RxwiqHyq4I8fh8pCRVdwcPVbQGK4KsjO/7QmQH7UnmfLiYeVjq
	H8qruTzc1G45bTaVQsoK6KfEmbkuuJo0Ai5puHLf5DYgfo1xedAwDQn01tlyarSvMfmB
	pbxGfLhSSW4By9UublSoccAgpWCe/1ez/caFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=p70/3KmJz3CIl00SpIRTyuKQ5IAHNN0SHzVA5Gj2PEGLbbw0ikb4nVNpc7AAQ0+0qb
	BaanGTmGZQ5hBd/r/wrMB+eBRaGdYqAh1Y2TiVbH+W2jVyfwcxBencujEccWSiBnYngu
	YNc6Rihhi53qargRnhQzzGvXxDqWv30y6FHEA=
MIME-Version: 1.0
Received: by 10.103.214.9 with SMTP id r9mr3742262muq.135.1296602145420; Tue,
	01 Feb 2011 15:15:45 -0800 (PST)
Received: by 10.103.182.10 with HTTP; Tue, 1 Feb 2011 15:15:45 -0800 (PST)
Date: Wed, 2 Feb 2011 00:15:45 +0100
Message-ID: <AANLkTinFOdeD61uqPNsQn_A+kmFCMXeFhtMT45sxxhhP@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Policy on (committing) large (1MB) machine specific patches?
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
X-List-Received-Date: Tue, 01 Feb 2011 23:16:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I would like to submit another machine to OE, but I need to bring in
vendor patches (which do not apply cleanly) modified by me, so they
have no Internet presence.
The patches measure in 1MB of plain source text.

Is it policy to commit this? Where is the limit?


I see we have lots of large patches:

cd openembedded.git/recipes/linux/
ls -Sshr `find . -type f -regex .*patch$`

...many of them appearing multiple times in the checkout:

ls -Shr `find . -type f -regex .*patch$` | xargs -L1 md5sum

eating disk space on the build machine.


Regards,
-- 
Leon


