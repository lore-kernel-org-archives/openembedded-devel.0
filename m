Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LezBi-0003E8-9S
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 23:03:38 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304215921.KEIY10385.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Mar 2009 16:59:21 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id P9zM1b0084dMFYL049zMqF; Wed, 04 Mar 2009 16:59:21 -0500
X-Authority-Analysis: v=1.0 c=1 a=V5V9HtveiJkA:10 a=uNyGdzrO2vsA:10
	a=yKtI0ae-VplE7RRuheoA:9 a=zqluDS7YDb3b_CEBUNccRbh6FboA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 14:59:21 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304215921.GB26343@smtp.west.cox.net>
References: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A2@EXCHSRVR.syntech.org>
MIME-Version: 1.0
In-Reply-To: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A2@EXCHSRVR.syntech.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Getting "fatal: Not a git repository"
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
X-List-Received-Date: Wed, 04 Mar 2009 22:03:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:54:56PM -0500, Mark Butsch wrote:

> Hello,
> 
> I am getting the message "fatal: Not a git repository" when I build. It
> doesn't seem to be causing a problem, but it bothers me none the less.

Totally untested:

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 18afc1a..d716bcb 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -807,7 +807,7 @@ def base_get_metadata_svn_revision(d):
 
 def base_get_metadata_git_branch(d):
 	import os
-	branch = os.popen('cd %s; git branch | grep "^* " | tr -d "* "' % base_get_scmbasepath(d)).read()
+	branch = os.popen('cd %s; git branch 2>/dev/null | grep "^* " | tr -d "* "' % base_get_scmbasepath(d)).read()
 
 	if len(branch) != 0:
 		return branch
@@ -815,7 +815,7 @@ def base_get_metadata_git_branch(d):
 
 def base_get_metadata_git_revision(d):
 	import os
-	rev = os.popen("cd %s; git log -n 1 --pretty=oneline --" % base_get_scmbasepath(d)).read().split(" ")[0]
+	rev = os.popen("cd %s; git log -n 1 --pretty=oneline -- 2>/dev/null" % base_get_scmbasepath(d)).read().split(" ")[0]
 	if len(rev) != 0:
 		return rev
 	return "<unknown>"

-- 
Tom Rini


