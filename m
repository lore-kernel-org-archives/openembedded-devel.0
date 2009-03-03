Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LeOyG-0005DL-Hm
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 08:23:20 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LeOuI-0006Q1-SG
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 07:19:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 07:19:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 07:19:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 03 Mar 2009 08:19:06 +0100
Message-ID: <goilla$vh8$1@ger.gmane.org>
References: <1236023043.6800.1174.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <1236023043.6800.1174.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: New recipe for openmoko QA test scripts
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
X-List-Received-Date: Tue, 03 Mar 2009 07:23:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-03-09 20:44, Angus Ainslie wrote:
> Please review for any policy violations.
>
> Thanks
> Angus
>
> --- openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb.oring        1969-12-31 17:00:00.000000000 -0700
> +++ openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb      2009-03-02 12:38:55.000000000 -0700
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Openmoko QA test scripts"
> +SECTION = "utils"
> +LICENSE = "GPL"
> +PV = "gitr${SRCREV}"

NACK, as pointed out numerous times before: git revisions don't sort, so 
the above breaks upgrade paths.



