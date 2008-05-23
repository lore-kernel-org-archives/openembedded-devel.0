Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JzV7Q-00083q-Cw
	for openembedded-devel@openembedded.org; Fri, 23 May 2008 13:07:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JzV4c-00021A-T0
	for openembedded-devel@openembedded.org; Fri, 23 May 2008 11:04:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 23 May 2008 11:04:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 23 May 2008 11:04:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 May 2008 13:04:22 +0200
Message-ID: <g168bn$lij$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008051303)
Sender: news <news@ger.gmane.org>
Subject: OEstats test deployment on amethyst
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 23 May 2008 11:07:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We are working on an official OEstats server for the oe project and have 
set up a testing server at:

http://amethyst.openembedded.net:8000

You can have your builder report to there by putting:

INHERIT += "oestats-client"
OESTATS_SERVER = "amethyst.openembedded.net:8000"
OESTATS_BUILDER = "your name"

in your local.conf. If you inherit seppuku _before_ oestats-client it 
will include the bugnumber as well:

http://amethyst.openembedded.net:8000/packages/apex-env/

The server is currently using the django standalone mode + sqlite3, but 
will move to apache + postgresql in the near future.

regards,

Koen



