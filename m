Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwKeo-00041Y-C1
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:25:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwKaU-0003lv-Q2
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 18:20:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 18:20:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 18:20:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 20:20:44 +0200
Message-ID: <gsl2ps$q6k$1@ger.gmane.org>
References: <20090421161342.GA5630@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <20090421161342.GA5630@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
Subject: Re: Ack for ffmpeg patch
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
X-List-Received-Date: Tue, 21 Apr 2009 18:25:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-04-09 18:13, Henning Heinold wrote:
> Hi,
>
> is the attached patch okay for dev. The patch removes the install
> of the headers to the legacy directories. Without the patch it is very complicated
> to compile xine 1.1.16.3.

NACK, it installs to both for a reason. You'll break other ffmpeg 
dependants by removing them. I don't think that's worth it to make xine 
work.

regards,

Koen



