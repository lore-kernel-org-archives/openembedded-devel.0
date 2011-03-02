Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Puq7n-0003oH-A3
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 18:46:11 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Puq6Q-0001EC-5H
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 18:44:46 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <9a9ee76e6057e7dfe38af1d77b4ed7ffc9ff3775.1299076392.git.bengardiner@nanometrics.ca>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
	<9a9ee76e6057e7dfe38af1d77b4ed7ffc9ff3775.1299076392.git.bengardiner@nanometrics.ca>
Date: Wed, 02 Mar 2011 17:50:33 +0000
Message-ID: <1299088233.23547.236.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2 2/2] external-toolchain-csl: allow linux-libc-headers
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
X-List-Received-Date: Wed, 02 Mar 2011 17:46:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-02 at 10:05 -0500, Ben Gardiner wrote:
> -	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
> +	rsync -a ${RSYNC_OPTS} ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}

If you want to exclude some files then it's probably better to use
something like tar --exclude ... -cf - | tar -xf -.  (I think the
--exclude option is in POSIX so any reasonable version of tar ought to
have it.)  Or you could use some sort of "find | grep -v .. | xargs cp"
construct to make a list of the files that you do want to copy.  Either
of those is probably a better option than rsync.

p.




