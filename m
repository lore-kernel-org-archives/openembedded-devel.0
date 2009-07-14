Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQpjq-0001uN-N3
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 23:40:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id BEA4050A99D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 17:27:18 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26564-05 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 14 Jul 2009 17:27:18 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9D0474DBBA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 17:27:18 -0400 (EDT)
Message-ID: <4A5CF836.6000309@cbnco.com>
Date: Tue, 14 Jul 2009 17:27:18 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1247599483.7178.11.camel@utx.utx.cz>
In-Reply-To: <1247599483.7178.11.camel@utx.utx.cz>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] glibc: install correct stubs (fixes midori crash)
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
X-List-Received-Date: Tue, 14 Jul 2009 21:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:
 > Attached patch prevents overwriting of a real stub include file by a
 > dummy stub file. Patch is tested only with the latest glibc from the
 > angstrom.

Hi Stanislav,

Patch 2/3 here fixes it:

http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/glibc_tweaks/

Also cleans some of the other lines that aren't needed.

Mike


