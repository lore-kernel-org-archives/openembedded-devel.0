Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PGKwr-0001Rk-Qq
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 01:24:11 +0100
Received: by qyk5 with SMTP id 5so152928qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 16:21:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.85.140 with SMTP id o12mr155015qcl.129.1289434912772; Wed,
	10 Nov 2010 16:21:52 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Wed, 10 Nov 2010 16:21:52 -0800 (PST)
X-Originating-IP: [93.81.68.23]
Date: Thu, 11 Nov 2010 03:21:52 +0300
X-Google-Sender-Auth: kMD-oc00eRSR-Y55Okwb8BrZHwM
Message-ID: <AANLkTimzOfyN6wHgP5pZ7rbfWawN4ri7UHFSUH4cEoZ7@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: JFYI: OE build time disk usage chart
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
X-List-Received-Date: Thu, 11 Nov 2010 00:24:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've collected some data about disk usage while doing last testing build.
Here you can see it: http://bit.ly/dnzIrq
Or long direct url:
https://spreadsheets.google.com/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=0

Google Spreadsheet chart loading will take some time so be patient :)

Columns A,B contains full measured data. Columns C,D are selection
from A,B (every 10th record) to reduce chart drawing time. Resulting
view is almost the same as with full data. Disk usage values are
'real' Mb (/1024).

Data was collected from following build:
BB version: master
OE version: testing_2010-10-29
rm_work: enabled
Parallelism: 3 BB threads + 3 make threads
Distro: angstrom-2008.1
Machines: efikamx (first peak), ben-nanonote (second peak)
Images: console-image x11-image opie-image
Build type: clean, but with different TMPDIR's for every machine w/o
removing of TMPDIR after build.

All sources was downloaded before and will not affect disk usage data.
Disk usage was measured by storing value of 'Available' column of 'df
-Pk $TMPDIR' every 10 seconds. Both TMPDIRs are on same partition.
There is no other processes who can write to this partition.
After collecting data I've found minimal disk usage value and
substract if from all values. Note that ben-nanonote values include
size of efikamx TMPDIR after build.

You can see here following things:
1) peak disk usage is about 23Gb
2) rm_work is working (right after peak), but, imho, is starting a bit late :)

Any comments/suggestions/requests here? :)

-- 
Yury Bushmelev


