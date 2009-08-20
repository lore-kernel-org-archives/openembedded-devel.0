Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Me8wR-0005dE-7r
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 16:48:39 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD0062BF30 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 16:31:20 +0200
Message-ID: <4A8D5E37.5010806@atmel.com>
Date: Thu, 20 Aug 2009 16:31:19 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Is it possible for a recipe to include/require something from a subdirectory?
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
X-List-Received-Date: Thu, 20 Aug 2009 14:48:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I just finished a nice gnome script which allows me to automatically
generate SRC_URI_append's

I select the files[1-4] in <recipy-dir>/<recipy>/<xxx>/<yyy>",
and then run the script

result is:

SRC_URI_append_<board> = "\
	file://<file1>	\
	file://<file2>	\
	file://<file3>	\
	file://<file4>	\
	"

Now, in <recipy-dir>/<recipy>.bb I want to include the file using

require <xxx>/<yyy>/SRC_URI_append

This did not work, so I tried symlinking - bad move...
I'd hate having to move it to the top directory of the recipe.

Any ideas?

-- 
Best Regards
Ulf Samuelsson



