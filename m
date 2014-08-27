Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 81B9070EF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:30:31 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XMXge-0001OM-AL for openembedded-devel@lists.openembedded.org;
	Wed, 27 Aug 2014 09:30:32 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:30:32 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:30:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 27 Aug 2014 09:30:22 +0200
Message-ID: <ltk1ee$tno$1@ger.gmane.org>
References: <20140823082635.A959850251@opal.openembedded.org>	<20140824223127.GN20524@jama>
	<CAMKF1soKopQn4kExeC=wUxCGrHMMoYkNyzO6Sy9VpmDQbddEPA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <CAMKF1soKopQn4kExeC=wUxCGrHMMoYkNyzO6Sy9VpmDQbddEPA@mail.gmail.com>
Subject: Re: mkvtoolnix broken by boost upgrade Was: [oe-commits] Saul Wold : boost: Upgrade to 1.56.0
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
X-List-Received-Date: Wed, 27 Aug 2014 07:30:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 25-08-14 01:26:
> On Sun, Aug 24, 2014 at 3:31 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>> On Sat, Aug 23, 2014 at 08:26:35AM +0000, git@git.openembedded.org
>> wrote:
>>> Module: openembedded-core.git Branch: master Commit:
>>> a6afd754290cecbe57392d13477557051b438817 URL:
>>> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a6afd754290cecbe57392d13477557051b438817
>>>
>>>
>>> 
Author: Saul Wold <sgw@linux.intel.com>
>>> Date:   Tue Aug 19 07:49:09 2014 -0700
>>> 
>>> boost: Upgrade to 1.56.0
>>> 
>>> Rebase boostconfig to handle moved user-config file
>> 
>> FYI: This breaks mkvtoolnix:
>> 
>> |      CXX src/common/iso639.cpp | src/common/iso639.cpp: In function
>> 'int map_to_iso639_2_code(const string&, bool)': |
>> src/common/iso639.cpp:595:30: error: 'class
>> boost::range::index_value<const iso639_language_t&, int>' has no member
>> named 'english_name' |      auto names = split(lang->english_name,
>> ";"); |                               ^
>> 
> 
> apply this 
> https://trac.bunkus.org/changeset/0c89ff941bfdd9f3378312f293a84f13cf3e2a96

Patch
> 
sent to update it to include that commit instead of cherrypicking it:
http://patches.openembedded.org/patch/79051/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFT/YkOMkyGM64RGpERAv4pAJ9YrG5DzP1c/UY8JbobmLyTwjKnHwCgmRSv
1guAdtOexueWMOH6uNVIP00=
=0mmO
-----END PGP SIGNATURE-----


