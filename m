Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gv96B-0002zC-Fa
	for openembedded-devel@openembedded.org; Fri, 15 Dec 2006 10:11:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBF99Wcr011236
	for <openembedded-devel@openembedded.org>; Fri, 15 Dec 2006 09:09:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11113-03 for <openembedded-devel@openembedded.org>;
	Fri, 15 Dec 2006 09:09:26 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBF99NRe011223
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 15 Dec 2006 09:09:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200612121628.07309.openembedded@hrw.one.pl>
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
	<1165238625.15272.3.camel@localhost.localdomain>
	<c384c5ea0612041234u5fd7e6d6w5de1efc385cacbd7@mail.gmail.com>
	<200612121628.07309.openembedded@hrw.one.pl>
Date: Fri, 15 Dec 2006 09:09:22 +0000
Message-Id: <1166173763.5437.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Fri, 15 Dec 2006 09:11:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-12-12 at 16:28 +0100, Marcin Juszkiewicz wrote:
> Does someone found better fix then mine?
> 
> [hrw@misc1 classes]$ mtn dif package.bbclass
> --- classes/package.bbclass     b4538ccc18abcaa057513563f37b2d25fdce5784
> +++ classes/package.bbclass     969285b9af2e3bc59048d34cf396dd529e496c1e
> @@ -576,6 +576,7 @@ python package_do_shlibs() {
>                                 path = os.path.join(root, file)
>                                 if os.access(path, os.X_OK) or lib_re.match(file):
>                                         cmd = bb.data.getVar('OBJDUMP', d, 1) + " -p " + path + " 2>/dev/null"
> +                                       cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', d, 1), cmd)
>                                         fd = os.popen(cmd)
>                                         lines = fd.readlines()
>                                         fd.close()

FWIW, this is the correct fix. Ideally, bitbake should have some helper
functions to set up PATH and run a program but at the moment it doesn't
so we need to do this.

Cheers,

Richard



