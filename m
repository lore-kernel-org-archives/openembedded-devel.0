Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ptkfi-0001Oq-Ii
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 18:44:42 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PtkeL-0004nE-HF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 09:43:17 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 27 Feb 2011 09:43:17 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Feb 2011 09:43:16 -0800
Message-ID: <4D6A8D24.2060000@mentor.com>
Date: Sun, 27 Feb 2011 10:43:00 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 27 Feb 2011 17:43:17.0347 (UTC)
	FILETIME=[D0EF1B30:01CBD6A5]
Subject: Preliminary agenda for 2011-02-29 TSC meeting
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
X-List-Received-Date: Sun, 27 Feb 2011 17:44:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please reply if you have any suggestions for new agenda items, thanks!

-------- Original Message --------
Subject: Preliminary agenda for 2011-02-29 TSC meeting
Date: Fri, 25 Feb 2011 15:19:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
To: tsc@lists.openembedded.org

Hi all,

I've taken the liberty to compile a preliminary agenda for the Feb 28
meeting (and yes, I edited Koen's message from last week as my starting
point):

Agenda 2011-02-28 meeting
-------------------------

01) Agree on meeting chair

02) Status report on oe-core

03) Status report on pull model, contrib repo and guidelines

04) Status report on board support layer guidelines

05) Status report on version retention policy and interaction with
oe-core / meta-oe / $distro layers
    (This was: Re-inforcement of the "don't delete all old versions"
     policy, make sure this is in the wiki somewhere. [Proposed: Graeme])

06) Status on Yocto / OpenEmbedded integration plan in oe-core

07) Start to think about the Policies section on wiki and whether it is
     relevant/correct now, and also what needs to change going forward
to Yocto.
     [Proposed: Graeme]

08) Come to a set of minimal quality requirements for our recipes/packages
     (e.g. must fetch, minimal required headers etc).
     My proposal would be to use the yocto requirements as a starter

09) Splitting our metadata into multiple layers
     I can think of the following:
     - oe core layer (shared with yocto
     - oe layer (or oe extra's or whatever you want to call it; containing
     recipes that are generic, not in oe-core and considered to be of
     common use)
     - maybe oe-old or so layer (recipes that are not maintained any more)
     - layer per distro for distro specific stuff
     - layer per machine (or maybe soc family, I can imagine it makes sense
     to keep BB and BB-XM together; similarly for the kirkwoord variants)
     - vendor specific layers (if needed), e.g. ti (although maybe that
     stuff could also go into a machine layer)
     Rationale is that users can pull in only those layers that they
need. [Proposed:
     Frans]

10) Consider a version based release mechanism
     yocto has a release model, intermediate versions are aiming to build
     but are considered to be less mature.
     If our core recipes follow this model, I can imagine it is a good
     strategy to follow in oe too. [Proposed: Frans]

11) Discuss future of our infrastructure (oestats, autobuilder,run-time
testing)
     [Proposed: Yury]

12) What immediate infrastructure changes are needed to work on integrating
     better with Yocto. [Proposed: Tom King]


