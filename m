Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ScucA-0000i8-Vj for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 10:32:15 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ScuS1-0002Q7-0x for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 10:21:45 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 10:21:45 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 10:21:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 08 Jun 2012 10:21:29 +0200
Message-ID: <jqscmd$9ms$1@dough.gmane.org>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSd7cUwPbTjcaf+cJHdRrA-=+sW6fAchu0_FURkqoSUzQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRSd7cUwPbTjcaf+cJHdRrA-=+sW6fAchu0_FURkqoSUzQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-xfce 00/15] bugfix, new panel plugins ans xfce4-mixer
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
X-List-Received-Date: Fri, 08 Jun 2012 08:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-06-12 11:51, Andreas Müller schreef:
> On Sat, Jun 2, 2012 at 2:15 PM, Andreas Müller 
> <schnitzeltony@googlemail.com> wrote:
>> All have been run tested on angstrom/overo
>> 
>> Andreas Müller (15): xfce4-session: add consolekit to RDEPENDS 
>> xfce4-xkb-plugin 0.5.4.3 inital add xfce4-wavelan-plugin: initial add
>> 0.5.10 xfce4-places-plugin: initial add 1.3.0 xfce4-datetime-plugin:
>> update to latest git and unbreak build with xfce4-dev-tools 4.10.0 
>> xfce4-diskperf-plugin: update to 2.5.3 xfce4-cpugraph-plugin: update to
>> 1.0.2 xfce4-clipman-plugin: update to 1.2.3 xfce4-genmon-plugin: update
>> to 3.4.0 xfce4-systemload-plugin: initial add 1.1.0 
>> xfce4-time-out-plugin: initial add 1.0.1 xfce4-embed-plugin: initial
>> add 1.0.0 xfce4-weather-plugin: Make it work for a while by using
>> different license info xfce4-mixer: initial add 4.8.0 
>> task-xfce-extended: add panel plugins / applications
>> 
>> .../recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb  |   14 ++ 
>> ...ugin_1.2.2.bb => xfce4-clipman-plugin_1.2.3.bb} |    4 +- 
>> .../cpugraph/files/port-to-libxfce4ui.patch        |  102
>> ------------- ...gin_1.0.1.bb => xfce4-cpugraph-plugin_1.0.2.bb} |    6
>> +- ...xfce4ui.patch => 0001-port-to-libxfce4ui.patch} |    1 + 
>> ...re.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch |   32 ++++ 
>> .../datetime/xfce4-datetime-plugin_git.bb          |    5 +- 
>> .../diskperf/files/port-to-libxfce4ui.patch        |  142
>> ------------------ ...gin_2.3.0.bb => xfce4-diskperf-plugin_2.5.3.bb} |
>> 6 +- .../embed/xfce4-embed-plugin_1.0.0.bb              |   12 ++ 
>> .../genmon/files/port-to-libxfce4ui.patch          |  150
>> -------------------- ...lugin_3.3.1.bb => xfce4-genmon-plugin_3.4.0.bb}
>> |    6 +- .../places/xfce4-places-plugin_1.3.0.bb            |    9 ++ 
>> .../systemload/xfce4-systemload-plugin_1.1.0.bb    |   11 ++ 
>> .../time-out/xfce4-time-out-plugin_1.0.1.bb        |   10 ++ 
>> .../wavelan/xfce4-wavelan-plugin_0.5.10.bb         |    9 ++ 
>> .../weather/xfce4-weather-plugin_0.7.4.bb          |   11 ++ 
>> .../xkb/xfce4-xkb-plugin_0.5.4.3.bb                |   14 ++ 
>> meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |   11 ++- 
>> .../xfce4-session/xfce4-session_4.8.3.bb           |    3 +- 20 files
>> changed, 147 insertions(+), 411 deletions(-) create mode 100644
>> meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb rename
>> meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.2.bb
>> => xfce4-clipman-plugin_1.2.3.bb} (69%) delete mode 100644
>> meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
>>
>> 
rename
meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.1.bb =>
xfce4-cpugraph-plugin_1.0.2.bb} (55%)
>> rename
>> meta-xfce/recipes-panel-plugins/datetime/files/{port-to-libxfce4ui.patch
>> => 0001-port-to-libxfce4ui.patch} (99%) create mode 100644
>> meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
>>
>> 
delete mode 100644
meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
>> rename
>> meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.3.0.bb
>> => xfce4-diskperf-plugin_2.5.3.bb} (55%) create mode 100644
>> meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb 
>> delete mode 100644
>> meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch 
>> rename
>> meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.3.1.bb =>
>> xfce4-genmon-plugin_3.4.0.bb} (65%) create mode 100644
>> meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb 
>> create mode 100644
>> meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
>>
>> 
create mode 100644
meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
>> create mode 100644
>> meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb 
>> create mode 100644
>> meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
>> 
>> -- 1.7.4.4
>> 
> This series can be pulled form
> 
> git://gitorious.org/schnitzeltony-oe-meta/meta-oe.git branch 
> xfce-panel-apps-update

It gave me a merge conflict, can you try to rebase it onto the current HEAD
of meta-oe please?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP0bYJAAoJEHZqAkdh1vT6p/oP/1JmUKMGnJgkfBdVSgclJSVO
bQJcqT4H1Xanbn+YbuFlW5n4wRalX+/3c8rj6qOIaGFJpqRCclJEtojC9lhZc1Wc
ubXACva7cW1WWNn2aDsKkS2uIoVjhT2dY+pTcnUvlJHvhkkACfXXSReixosfzLrh
ZkhXEpqLIkHhLJn66hSolIimLBeF+ylMJk85uHCl1/vLwuXjhD26Rdg/kqE1Q9dZ
pJBP4HMdQsrMIYClX474Rg5f+gVms2S4P9Ti7X45QotSpQ99VsNcrXmzItZa8cey
0krsrP8irDff3hjG8Psi4dEKWH7giK0ukfrtDUGQ1dkkawqJ/byL/N85lPs1bwCo
YVq8ewZAgo8MWK2byGN87eNpfpR7mOTW9rC/kZgoSLEDKO0sMeX6plDdQf4QtD9u
XMY0L52WR88iy1y7yEZnebFlIKo+HEJjVQ6DEBFAcUqFZCyKFKABMM8lM0h9eEjr
NorEMQRLOX7xfo4WffJZ+bBp9+0LMG0KhloOSGaf85ajgYmHL4NftNqmdKD4r/4r
5utD3RQATrZ7NOC7WRKeE9QW00/D03vAC6UeMfefIx+l4m+Kt8D0iD3qLzp4qB1V
T/d/Fk5rnmuaVXDXu/0yUj5vB7+i6bak7OEqLkOa7qIu6hBJrJBZejYGWOUQZG3h
NV4T4IWuBQsTndc1oDc8
=8D4v
-----END PGP SIGNATURE-----



