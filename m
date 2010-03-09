Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NouHk-000321-RK
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 08:55:29 +0100
Received: by fg-out-1718.google.com with SMTP id 19so1093460fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Mar 2010 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=S/D/N41W23tadrqkI8rJiqeLyx9Gm5H9NSSY7SoCKn0=;
	b=QY7K0P9kV5bSVewiV2vJPoVuhkWIpwejZRFDrIbvaV/Eh7giIney4uLj/McLaDbCPA
	lpyXAsQJG6U9r+0aZ0jHZMfdgZPOfQHRjs89rpSkni4FZJxqa5ZsnGcDNzC4LczuwYa0
	pkTeg4Nn/WWY9T7b8HffYvPZdxwYpOPuvBCnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=xwxC6Pd1ZUhM2UGXzopzJC4aZhpFAElTxzsOkIdYdECSH1bfhlEovA7gv9MQpBOB3Q
	sw9noHOthkfgysVC7MUpPFK8Ye018vga9ZROEKpM9kDXmr63DrSz5fby37wQA4OZ+eRH
	hJ+mW++MqxYVeZOPGdlDMfNHNNhMdoh0GSjyY=
Received: by 10.87.73.23 with SMTP id a23mr8774196fgl.76.1268121150511;
	Mon, 08 Mar 2010 23:52:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3532591fxm.14.2010.03.08.23.52.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Mar 2010 23:52:29 -0800 (PST)
Date: Tue, 9 Mar 2010 08:53:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100309075331.GL31945@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Tue, 09 Mar 2010 07:55:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

what it missing in bitbake master to call it 1.9.0 and switch all to
this version with sanity check? I'm using master on my builder and SHR
builder and it works good. (Only issue I still have is oestats-client -
reported yesterday to bitbake-dev list).

In this version is support for LOCALCOUNT override, which makes SRCPV
usable with multiple builders with shared feeds. Which was only big
complaint against using SRCPV for git recipes.
http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=2f32735463159e9e42e03819d6b505dba49c7f17

My SRCPV migration branch is quickly rotting.. but I'm willing to
check/do it again, because resolving conflicts with every small change
in git recipe takes me more time than merging SRCPV to oe.dev would
take.

SRCPV migration thread:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01325.html
or really long and boring description 
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01607.html

Thanks and cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


