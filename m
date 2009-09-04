Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MjVbj-00063o-0x for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 12:01:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MjVJM-000578-95
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 11:42:28 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 11:42:28 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 11:42:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Sep 2009 11:42:06 +0200
Message-ID: <h7qnde$o9a$1@ger.gmane.org>
References: <4AA0D896.3030607@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AA0D896.3030607@dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: dropbear-0.51-r3 allow-nopw.patch: No such file or directory -> reverted
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
X-List-Received-Date: Fri, 04 Sep 2009 10:01:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-09-09 11:06, Steffen Sledz wrote:
> It seems that commit c26fc5db90702b035bd545cff3ee7575a0f9b70f was incomplete.

No, that commit is just plain wrong, from dropbear.inc:

do_configure_prepend() {
	if [ "x${DISTRO_TYPE}" = "xdebug" ]; then
		oenote "WARNING: applying allow-nopw.patch which allows password-less 
logins!"
		patch -p1 < ${WORKDIR}/allow-nopw.patch
	fi
}

The faulty commit in question breaks that by applying it it 
unconditionally and not fixing do_configure_prepend.

I've reverted that commit in the meant time.

regards,

Koen




