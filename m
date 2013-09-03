Return-Path: <olof.johansson@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 321646C011
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 7DA5D19D36
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dbwvrgPXSyYl
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:20 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id AD2CD19D1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 909FF551
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:16 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 85A5B71C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:16 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 83C9E3E06F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:44:16 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Tue, 3 Sep 2013 17:44:16 +0200
Date: Tue, 3 Sep 2013 17:44:15 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130903154414.GD12638@axis.com>
References: <1378222415-13643-1-git-send-email-erp@movis.dk>
MIME-Version: 1.0
In-Reply-To: <1378222415-13643-1-git-send-email-erp@movis.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-perl] libwww-perl_5.834: added
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 15:44:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-09-03 17:33 +0200, Emil Petersen wrote:
> +RDEPENDS_${PN} += "libdigest-md5-perl \
> +                   libencode-perl \
> +                   libio-select-perl \
> +                   libio-socket-perl \
> +                   libmime-base64-perl \
> +                   libnet-ftp-perl \
> +                   "

I notice that some of these modules are core modules
(specifically the ones left in the quote), and I guess it would
be better to depend on the perl-modules package instead (the
package containing all core modules)? Otherwise this may require
a great deal of maintenance when upgrading to newer releases.

-- 
olofjn

