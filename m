Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J4ny9-00065n-QA
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 02:43:36 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J4ntH-0002Fc-Iv
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 01:38:31 +0000
Received: from v-209-98-139-195.mn.visi.com ([209.98.139.195])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 01:38:31 +0000
Received: from grante by v-209-98-139-195.mn.visi.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 01:38:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Wed, 19 Dec 2007 01:38:23 +0000 (UTC)
Message-ID: <fk9sme$nsr$1@ger.gmane.org>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: v-209-98-139-195.mn.visi.com
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: Confusing wording on GettingStarted page
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
X-List-Received-Date: Wed, 19 Dec 2007 01:43:38 -0000

There is some confusing wording on the GettingStarted Wiki
page.  I tried to figure out how to get an account so I could
fix it, but was unable to.

The issue is that there are places where a Monotone workspace
is referred to as a "database".  A Monotone database is
something completely separate from a workspace.  For example in
the "Updating OE" it says

   Then update the branch(es) you are using. This will update the
   contents of the files in the local database. For example:

     $ cd /stuff/org.openembedded.dev && mtn update
     $ cd /stuff/org.openembedded.dreambox && mtn update

The commands are correct, but they're not updating the local
database (which is a file typically name OE.mtn), they're
updating two local workspaces.

-- 
Grant Edwards
grante@visi.com




