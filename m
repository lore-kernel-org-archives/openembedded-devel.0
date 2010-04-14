Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O22bv-0001Z3-BF
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:26:32 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3EDN1fM003516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 15:23:02 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1O22YX-0006Ao-Ab
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:23:01 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1271238118-6524-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Wed, 14 Apr 2010 15:23:01 +0200
In-Reply-To: <1271238118-6524-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	(Enrico Scholz's message of "Wed, 14 Apr 2010 11:41:58 +0200")
Message-ID: <lytyre183u.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Wed, 14 Apr 2010 13:26:32 -0000
Content-Type: text/plain; charset=us-ascii

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:

> The old dangling link detection used os.stat() on the file and
> registered it as a dangling link when it was not found. This causes
> problems when the link is an absolute one because it will check
> files of the host system.
> ...
> As this is only a QA mechanism which does not affect the resulting
> package, there is checked for generic OSErrors only, not only for
> ENOENT.  Other problems (e.g. EPERM) will be reported by other
> functions.

oops... forgot the

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>


