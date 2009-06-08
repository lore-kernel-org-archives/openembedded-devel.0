Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MDhC3-0005zf-RN
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 17:55:27 +0200
Received: (qmail 23124 invoked by uid 813007); 8 Jun 2009 15:45:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Jun 2009 15:45:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jun 2009 17:46:57 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.4;
	x86_64; ; )
References: <f96d234e0906080759q40afd1dau930f93999048fbd9@mail.gmail.com>
In-Reply-To: <f96d234e0906080759q40afd1dau930f93999048fbd9@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200906081747.04528.marcin@juszkiewicz.com.pl>
Subject: Re: OE weekly changelog 2009-06-01 to 2009-06-08
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
X-List-Received-Date: Mon, 08 Jun 2009 15:55:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Consider this change to contrib/weekly-changelog-report.py script:

-os.system("git-shortlog --since=%s --until=%s | grep -v \"Merge branch\" | grep -v \"Merge commit\"" % (start_day.isoformat(), end_day.isoformat()))
+os.system("git shortlog --since=%s --until=%s | grep -v 'Merge branch' | grep -v 'Merge commit'|sed -e 's/^    //g'|cut -b -78 " % (start_day.isoformat(), end_day.isoformat()))

It will cut mail to 78 columns so it will be easier to read. Maybe will
also teach contributors to write shorter summaries ;)

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




