Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QwFMj-0007gC-3g
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 17:27:41 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	B66E358BD7D_E55174DB for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 15:22:53 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	9855C58BCFB_E55174DF for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 15:22:53 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Wed, 24 Aug 2011 10:22:06 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
References: <4E4E536D.7010103@dresearch-fe.de>
	<4E4E738C.70109@dresearch-fe.de> <4E5356B2.3060908@dresearch-fe.de>
	<4E53583A.3030405@gmx.net> <4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
Date: Wed, 24 Aug 2011 10:22:52 -0500
Message-ID: <1314199372.21496.12.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 24 Aug 2011 15:22:06.0326 (UTC)
	FILETIME=[95576160:01CC6271]
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Wed, 24 Aug 2011 15:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
> I suspect that the problem is happening earlier, classpath isn't building.
>  the javac wrapper eats the return code from a java compile.

If George is right, then the following patch to the javac wrapper script
may fix the issue.  It fixes building classpath as well as returns the
error code if all javac attempts fail.

http://patches.openembedded.org/patch/9521/

Jesse




