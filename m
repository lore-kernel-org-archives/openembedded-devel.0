Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Lyrwu-0001rV-BS
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 20:22:36 +0200
Received: (qmail 5318 invoked from network); 28 Apr 2009 18:17:20 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 28 Apr 2009 11:17:20 -0700
Date: Tue, 28 Apr 2009 11:17:19 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090428181718.GU18788@smtp.west.cox.net>
References: <20090428040959.GT18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090428040959.GT18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Enable PTHREADS_DEBUG_SUPPORT on all uClibc builds
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
X-List-Received-Date: Tue, 28 Apr 2009 18:23:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 09:09:59PM -0700, Tom Rini wrote:

> As has been reported, building uClibc with PTHREADS_DEBUG_SUPPORT=n
> means that task-sdk-bare won't install due to missing uclibc-thread-db.
> The following enables it everywhere it was disabled and bumps PRs.  This
> should be fine given that we already have separate debug packages and
> the extra files end up in an additional package.

wogline had a bit of a concern on IRC, so some grepping in
0.9.{27,28,29} (I had checked 30 before) shows that really all that
changes is that libpthread is built so that libpthread_db is used for
debugging (and thus some debug stuff, that we would have end up in the
-dbg packages anyhow) ends up in a different file.

-- 
Tom Rini


