Received: from rcdn-iport-9.cisco.com ([173.37.86.80])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fstakem@cisco.com>) id 1USoPZ-0002hE-8T
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 14:58:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3244; q=dns/txt; s=iport;
	t=1366288830; x=1367498430;
	h=from:to:subject:date:message-id:mime-version;
	bh=uA74tfW5VgB3yVanJchxF2s2sEeeSke7OY7at/Y756w=;
	b=Qxe+DjbRMBEpgX1BOwuzpDK6gieMaCItUeOri8BlNtbZeTJGUp1St2LX
	Zu/w5Mx65nrI6C7q/4HIsPpBvzSGYCWgIJ5B++SmrgkMvEkaUxtuHaana
	Dl2Sp+rQG5foa/6JQuLzgQ4fT2F/HgttouYOtxXTO4XsuRAxtVWDUY8oq U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ah4FAFHob1GtJV2a/2dsb2JhbABQgkJENsBlgQEWdIIhAQQtPwoVAQweQxMmAQQbiAydAKE2jmmDHWEDjX6TEocKgwuCKA
X-IronPort-AV: E=Sophos;i="4.87,501,1363132800"; 
	d="scan'208,217";a="197249726"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by rcdn-iport-9.cisco.com with ESMTP; 18 Apr 2013 12:39:23 +0000
Received: from xhc-aln-x05.cisco.com (xhc-aln-x05.cisco.com [173.36.12.79])
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id r3ICdNQN022489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 12:39:23 GMT
Received: from xmb-rcd-x09.cisco.com ([169.254.9.83]) by xhc-aln-x05.cisco.com
	([173.36.12.79]) with mapi id 14.02.0318.004;
	Thu, 18 Apr 2013 07:39:22 -0500
From: "Frederick Stakem -X (fstakem - INSIGHT GLOBAL INC@Cisco)" <fstakem@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Information from a bitbake parse
Thread-Index: Ac48Mb2jAbVp4bjaT8CXsnV1/Y3xgg==
Date: Thu, 18 Apr 2013 12:39:21 +0000
Message-ID: <48B972723E0C6F45AE2F2588F9846DFE0FB3AAB1@xmb-rcd-x09.cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [64.100.86.167]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Information from a bitbake parse
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
X-List-Received-Date: Thu, 18 Apr 2013 12:58:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have been poking through the bitbake python code and can't seem to figure=
 out this problem. I want to parse all of the bitbake files for a build and=
 have this information exported into a text format. In short I want the inf=
ormation in the recipes condensed into an easier to parse format so that I =
can use it in my own software. Does anyone know how to do this or where in =
the code I can gain access to this information. I have put a decent amount =
of debug code in the bitbake cooker but have come up empty so far.

fred

