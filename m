Received: from mail.belgium.oneaccess-net.com ([213.246.205.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sophie.bonnouvrier-ext@mail.belgium.oneaccess-net.com>)
	id 1TBiYZ-00054N-Jk for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 10:44:23 +0200
Received: from [10.1.20.80] ([10.1.20.80]) by mail.belgium.oneaccess-net.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 12 Sep 2012 10:29:53 +0200
Message-ID: <50504801.8020006@oneaccess-net.com>
Date: Wed, 12 Sep 2012 10:29:53 +0200
From: Sophie Bonnouvrier <sophie.bonnouvrier-ext@oneaccess-net.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 12 Sep 2012 08:29:53.0764 (UTC)
	FILETIME=[C89FAA40:01CD90C0]
X-TM-AS-Product-Ver: SMEX-8.0.0.1181-6.500.1024-18644.002
X-TM-AS-Result: No--0.620100-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Subject: [recipe]variable shared
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
X-List-Received-Date: Wed, 12 Sep 2012 08:44:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hello,

I would like to set a variable in a recipe and used it in another one.
but when I get the variable in the second recipe the value is none.
How can I shared variable ?

Sophie


recipe 1:
export XENO_DIR = "${@get_xenomai_dir(bb, d)} "
export XENO_PV   = "${@get_xenomai_pv(bb, d)} "

recipe 2:
   xeno_dir = bb.data.getVar('XENO_DIR',d,1)
   xeno_pv  = bb.data.getVar('XENO_PV',d,1)


