Received: from bosmailout08.eigbox.net ([66.96.184.8])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from
	<SRS0=EB+tnJ=CI=mindchasers.com=openembedded@eigbox.net>)
	id 1SEphN-0004dU-1g for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 00:26:05 +0200
Received: from bosmailscan04.eigbox.net ([10.20.15.4])
	by bosmailout08.eigbox.net with esmtp (Exim) id 1SEp4R-0001LC-Pv
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 17:45:51 -0400
Received: from bosimpout02.eigbox.net ([10.20.55.2])
	by bosmailscan04.eigbox.net with esmtp (Exim) id 1SEp4R-0004AW-IC
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 17:45:51 -0400
Received: from bosauthsmtp13.eigbox.net ([10.20.18.13])
	by bosimpout02.eigbox.net with NO UCE
	id t9lr1i0030GvDVm019lrYq; Mon, 02 Apr 2012 17:45:51 -0400
X-Authority-Analysis: v=2.0 cv=BexvJMR2 c=1 sm=1
	a=1tk2KXT9X5KuiK9ZGSyBkw==:17 a=mn2ndCrYJZwA:10 a=Na1N3YiFAQsA:10
	a=9__qD4EXiBwA:10 a=Lk7aQFya1KUA:10 a=8nJEP1OIZ-IA:10
	a=RJKT5QAX3-Obpx91Eg4A:9 a=wPNLvfGTeEIA:10
	a=UH8/iCWBfdUmbm4Ft4Vi3Q==:117
X-EN-OrigOutIP: 10.20.18.13
X-EN-IMPSID: t9lr1i0030GvDVm019lrYq
Received: from [108.25.140.29] (helo=[192.168.1.41])
	by bosauthsmtp13.eigbox.net with esmtpa (Exim) id 1SEp4R-0001ZU-8U
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 17:45:51 -0400
Message-ID: <4F7A1E0C.9030201@mindchasers.com>
Date: Mon, 02 Apr 2012 17:45:48 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-EN-UserInfo: cb6d325fe03740ac93d537d78041f599:2186c883651a1065ea1e15c5a112545a
X-EN-AuthUser: bcochran@mindchasers.com
Sender: Bob Cochran <openembedded@mindchasers.com>
X-EN-OrigIP: 108.25.140.29
X-EN-OrigHost: unknown
Subject: Is boa still a decent choice for an embedded web server?
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
X-List-Received-Date: Mon, 02 Apr 2012 22:26:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

*** apologies: I accidentally sent this out the first time on the wrong 
OE (commits) list ****


Hello Group,

I would appreciate any thoughts about the relevancy & security of boa 
for an embedded system that needs to support up to several active web 
requests at a time.

The code is getting old and some of the system calls are deprecated or 
obsolete (e.g., gethostbyname()).

Apache appears to be overkill for what we're doing.

Ultimately, our web server won't just serve static pages but also serve 
a low volume of python / django pages, too.  I realize that CGI 
performance with boa is bad, but it seems that there are options to 
increase performance over simply exec'ing the python scripts.


Thanks,

Bob







