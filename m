Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0068.outbound.protection.outlook.com
	[104.47.37.68])
	by mail.openembedded.org (Postfix) with ESMTP id C45C577E97
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 22:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TXu+lSeS1VJree3ODTeInXFnSigLkPqYb1tP3Pf9kzw=;
	b=jchj7TMwBWqYGpPcyos6iIo90cY1nBnusm00XtNsiBBjG+X5lSo0QDNxXlb36NToIVL3mGm4VOSXCGn7E2LAU5cvTtvD04Rxcjd4y/72PouPMfbq/9fxMYPAchF463SFvWj8xc+rw7MGH4jJLeynweT0JRcrFTHOhzaemjkgNkY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:48:46 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:47:36 -0700
Message-Id: <cover.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR06CA0037.namprd06.prod.outlook.com (10.168.181.23) To
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 744912c9-d2b6-4b3e-06eb-08d4ba8a024b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:0139jNGmwU+srHbmbCG7svAwUQXxQC53MbEa9VgUXbyp4Z2KbZud+lwkI4v0JqleqHzmYoqAwIIGOdR6yRwXqdiblGF7C7DqiVrIWT+kUc9M5Y2/ZTB89hyGqHaeYKtEPh++fO1xHJ9bLxljXClZ6oA0W7o1+JTHyQxXgSpSk0aZE28yFoZg/x1bqZh64LvTxPtdQWcwYYzD0QZTqtd8tAifgxEEXf53dTz5ecrMdnlKnwVIIYavZMV8iAhLF57umbRxd/kBjrSolR85h15CBTGO6kxHppgkQ70+EYh1GJWznw9JNl9LP7AUeoJ5meW4cYIBRzeoLlXfxx/Uq+2Usg==
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	25:AyBzWIwypLR0/2LcLOmzTQzf72fdWe9K39J1ml9ucgTCFEDRRpFEBnAheeK/XJNtrnCIPEiJ/+W4xU/hZYF142oiPZnPAjn7lUxk1ALMgWSX4QU8nksYAkq4YsLo9DZl/Np70MuoIKTdgorShlOWWqFW6A5cOaLLkOeFND8C9tjCGgkecj2EpFQmxZANj4KDhb+jf2y8qBN06FO2EoQEFmAHf0IAuuAZTZjPNHyAyCudFC27RRl/4buLYXLt0qsf3J04PDdO6Hak/Wy5XvDDn25rzk2ukSKIUeifz1lcI3C57r2faSnckCDPBr6X8F8Ee9VOkv9TSKPAh2Jm0JTmAVXI72XkchjAlAUMRmOJrTxM8iN/G5P/yDdv6LyDdyRIZiRfobKYbyLS28pCBVrieqkqfkgQXN5UC2MFewSVvz69JjT7rlXUr1pMMGR4uog76LAdspFkxqKAeeBhz40+EVB4pbelKG+/aT5uVsZ0E0OIApYjfiTo7CxSl0zS2vPyuJItEetVP/BbAJFlraisrAu4ofQtN98O5w+sXKHSj53wt7GzmXmI/u3qQecj8yv2DqZ2ro7lL1c/x0P8NLqWt7vMVIWqgDxbj4t29SWNP5IpbGYZdrZV0ehOiJDpqfbkMmq4GPolEs5+UfB9zFqNE7zAuNuXQwkTl8uo1/wCL4wUVMxx6XZ7By054jKSUquB57NoiQ555IcIYsEInZoDulOgK78SW/eei8tJrRPE2msAsmDJHfe5yNdYKvL0oKKk8UWxdKSamYbAWBvPKUSHvy5Ap9zplI8a+0GO0mQ+82iuPreOPmC5awMjl69685MNqQDNWm1g+LclaRqVaFGgwmW5H+Q3tW3sSmyqoVr3EGG63OZ0uB+6RLyHDhK1EQAvAc3nmXQ7RuaGj/ZExJjJptdGrjBp1WxGId6lPX5/1+0=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	31:gMr7dOFoqS9T8btSIQtm9QWl7tsv/kFK/MYjKdAHdV06PBZApM1PnRuFJUo5k8q6B45IbvvZ/DIWn6J7axGALjy6ydtRqBh9vxEdVWHoe7JpRQsyO8GiiEje1j0MvCc07Y9n+rDlFy4Ayc0wmY3vybLeJkcPNRDSq8eSzmnxAhLQnSKeUNUriWkw5hftiS1tLzTObLsNUqURV/M5gawPNdaxi8FsHsn83u8F13DNGwSr2GgpMNA/jC3N43VgCyXxO7lzAvhSGktPqcdu9WQGFeYbTRj2Lt041AnEs/sVfbDUrozIaAf43rCzZslUNY8XNNB0piB0hU1+tzksuaY5LqX34+8ifqdhil1n33XTcrJOENx7JiivzkZ75xEDFQQ5xRq/+woid6WhhIyW6b7in1Mdx5oqYKGuP0ycLNdvfKdUwxN07cki6BCxw6IeYMh1Ko59/QlK3BG/qF7NofKXkhsye5CHzD2dhz2Fw1tgPa+BRG1rGctS6yy2fZjAXuunG133jNhOxALuUvLySpVVuO2RP6VbjTcUf9wBXA24rOMOxwQjvF/fOG/l0QPo3SB8z6VpGLtK/FpQzYuhO0C2oIZoAnumeq3IexFD2CuBUghohlAvcopRbrmwhZPVA1eIKLOvrjzJrIDF9uI6UR8AWw+YTwUbRjALKptx2ipxrmI=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:SFkvRxtDG6a+iDx9+4J2BIWUiR0q7O5akfCdWiqz7MszYNlsAOsvRNYIMVxm0dqqzplIBVUlUbYxgrMMFqwBLcIoCOvzT21bAA/GHk0jDSWcoLByhhcOimCkTWC5nRN88i9GQwqqafldOoOD9WTH7ofQUxLofvL0/KPjgrLUp/DoSxRT3so1c836wigAFGHixKiIirhgzK0vkohCUEb4hpBsmArBhOYsawAXszFJG05lg5z2luzJC4b/TrKUyGfIJBf93mT3VWwFDieZvyEhTDB5KH49KNCnhZxn6x7sv3h4qMp321TvOOwdmRjLORrl7qQ3YPK/src+aomFDJU9Ow==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2943FD764F3E1AAD4F72C097ABD80@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(133145235818549)(236129657087228)(148574349560750)(167848164394848);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6041248)(20161123558100)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2943;
	4:ykam7vhnytvCTSdrzAKVhze71Va3DvAUndpGEjmp?=
	=?us-ascii?Q?3El2VIxaSEQZhYxLxm56iuFuedfuLxKVpmBHGo9qHl7AzI2LZWtXP0ngS7oX?=
	=?us-ascii?Q?guuwzHGfIv4xSWVTLzkcTgtHt8KrulObgfjqjHaaDSWPar/uymo8Pomg7TMY?=
	=?us-ascii?Q?4iinEOcSME1N5nWpc/EWcy33eszP0oE3wsahjW8qC+5n4W2UIpcF2I4lzhfv?=
	=?us-ascii?Q?fNdxjaXS3A5bX4srvtC8nm5aItxS1Efew813NE0Db+ExBZQlI6f+9Zcc/Ti/?=
	=?us-ascii?Q?52FM6O88tjNNfO1GnhkxY/wNYS6EDvarLHokbvH+eCJAf+FciITg+NSmLjeJ?=
	=?us-ascii?Q?NOF4jrsITrfytsKGav8nd3odk/bEUGTJeeD6EJWTBYknTeMckIpRjwHx7WKZ?=
	=?us-ascii?Q?hlZnq7jImJeyFiBhaJi4CfkZqJvdwimLXOSxlBhpk3HuFdEFKz/LdqGr5O7T?=
	=?us-ascii?Q?rO/JlqX/3BzV7+9cuDbCtVFIvL8liO8A0sb5lv5n6MThHFgpHA2amziJPdPF?=
	=?us-ascii?Q?Lc/aYapNOkXhGhfLd6a8XyBZDH2pf1Nvju27zW6JlxyPoeArzlT3frf59q8i?=
	=?us-ascii?Q?7/YahUnJZaAhwHCPBHoRm7m9j3AFUedm9kTQcd3+Sou46YJSxzfQFWJRUH2D?=
	=?us-ascii?Q?hzJYONvJhJ/k2GHP4pKZf/uJVnbeDrDLac6S/O3lS0xOkYkaoRY89TN7iJ3B?=
	=?us-ascii?Q?dxs4tATAb2gRonnw3Rr++A507aDwBPa5lRkiqRBMXssYg9WyCu8VhcnwAvV1?=
	=?us-ascii?Q?oIq1hVIqm1kjbIHHpR1yGorx621fv2daXPiSJRb2YQW8G+bBOellV3JtjehH?=
	=?us-ascii?Q?JtknLc3dLQuURk2HCtTTWtX+i+868U7tuITAUMPvBwVJ35VQqAH6FfnrUlyX?=
	=?us-ascii?Q?+avzhdxxMgRWFOnl4HKrzaj5wtvOBkgcI7JeZkMq+FhKA5crU/IY9UBPwIWJ?=
	=?us-ascii?Q?gY400sj8OVuckMX5VrbtqafrVcX9vnsk0lhmHNn94Huo7ULknnOYM+F8PFBb?=
	=?us-ascii?Q?ER9OGCCkTT+SGAJUT0i9vBYO+gQyfCC/9nUTkronkdpO2OqXXS7bqHbtY4i5?=
	=?us-ascii?Q?bUiO2oZw1LPf6DIP/nNrmsQCcxZ2GfysZgDxOXbnvFRrzBQKpPJ/PuWUZC2G?=
	=?us-ascii?Q?Gyzc9+X+Avlh0cr7KbChdmZozHJ0D4ilW8Hq4zMYHo3KNUQvdf+pSMLQUxy2?=
	=?us-ascii?Q?ODyIAB4+hZEX5ipFTXa28Z3FNzl0dmao3wxabRrK6iOO1MP9CmG9KfwGvYmC?=
	=?us-ascii?Q?s4yabY7MgcL8RU3fpNPZXwM/AI180qkyILm2B/RQV64ja3xawVsmmDfeW7TS?=
	=?us-ascii?Q?/zkbiDV2RptERQq1C/kh3g4=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(377424004)(53754006)(50986999)(966005)(66066001)(47776003)(42186005)(5003940100001)(4326008)(38730400002)(54906002)(50466002)(25786009)(478600001)(6916009)(53416004)(110136004)(6306002)(6666003)(6512007)(48376002)(53936002)(2906002)(33646002)(305945005)(50226002)(8676002)(6486002)(3846002)(6116002)(36756003)(81166006)(6506006)(86362001)(189998001)(230783001)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2943;
	23:tygWeGgXKmZ8Mg4Dqc3ZyvdDSGpiUhpMfhTmJZK?=
	=?us-ascii?Q?FgNxvfitzcJJMDDYs70PbarnARCExM4L60RJ+rihkHILn1jXg+GjZYgLg9QX?=
	=?us-ascii?Q?RIhRlCAR6ELIAFi6t7J+pbpdKq6L7zT5JuyiPYMB1xcVXJ1qfedwR4Cp3N3t?=
	=?us-ascii?Q?O2qIOqBEz2w08q7/uqflCrvvXO2HNwaS+nOloQCtYQnY6HcOJAgcNgbgnAGw?=
	=?us-ascii?Q?zJZTwLk/Uc5xh1Nn2E+H2o5pObQIyrBy3B/cxc8tVtidZr02BMcy5tD9u0r8?=
	=?us-ascii?Q?I3KNoZIJ1IQo4xBYU7SaASCf51aHdw51JVdjzW3H1cvpZ1HqcqR9ut3CSFdR?=
	=?us-ascii?Q?uM0m1yjfuD5MKOyCpIz3jgOeW3mosBUHWzPQR538b7oUhlX1ir4O0JlDxR8G?=
	=?us-ascii?Q?pYx7Ux3qyfWZaCxvSGnOoi4b2Dm0C8fDm87Nn4Wy3pLLvNRTnaHam4Tpee8S?=
	=?us-ascii?Q?rvDm5Hea8gHfryZL8dyJlvJd35YWI7ofmQCdsYCa/qct/UJcxkinV7iOrGlS?=
	=?us-ascii?Q?o4YfN3t7J9VeuMsIztiD6zvwUZJdletz/pqdFZ/u+nKgbW4hLb1pubWe02YW?=
	=?us-ascii?Q?TDrGaQKbElsdSiJ3rkrvIRBjPDA7qSVBLtTTZPD+VLkaNqBadgOBw3/N3zNC?=
	=?us-ascii?Q?hbflQ+wxcbtCPYTxu7WfbtMb1s700xTXbwNGlM3QEl/yu2B0RwPG8rZ0X23d?=
	=?us-ascii?Q?ZSEpPdJ1oHWx6O55Dsqyia4axbU+vIPI/KHv82uuDNmeKfeG8Epci23Gd51m?=
	=?us-ascii?Q?KgLDvhYu5fnhJ27p7GY0moTkt3dLHKkMxdJbN+1nEugXPrseS0PqZ5WjJEfd?=
	=?us-ascii?Q?T+XI2/CDxtmVrhFPbdYQK3GnXr1vJhJdzGizggDrfbT+BzjqWBuXt2PLQKSq?=
	=?us-ascii?Q?0Q690RK1b5r88YWWEJfqOhr9CLlKchL1RizJggQm2jj0mfqQVhhni3IIKpGC?=
	=?us-ascii?Q?ZskhqMqvyTkkKbnMOQZoNyrpcOGKKCQuSmwl4DcPa+mtUenpEXC2qqsrUS3K?=
	=?us-ascii?Q?ojywwRroTGfkshYgEqqozqxS0/8Khq62KMzW9BE0giCOhAZ69qBlMaaq5WN8?=
	=?us-ascii?Q?k/zMPX5QGmtB2AdPpsWbvtoOo83A4?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2943;
	6:hcX2wb28mz803KLyzGThvkkaxUz8AS4vC9l7w/Rq?=
	=?us-ascii?Q?rLv0q5K6GpPF330QA5mawpc/MFMRIrfEAKarf9eADiEgQQot2ngU5ELcxoIc?=
	=?us-ascii?Q?MtNJP5Enp59qyVxkBuKWFQrRLYUPCzKsVxmvpSK0/3pMxRkjQx3/taTFaNv2?=
	=?us-ascii?Q?G93hBniav2PQwgcajE2ht6H2n3jPYwfHlVzcXZbM6MtHSzATmS9JnCcIGbQ2?=
	=?us-ascii?Q?/7xj/6FXkREo99KwEvbw7eP5ZDFA/JvY9y9sF8cDgktSpWZFZqnvkwATcfvl?=
	=?us-ascii?Q?UMkZeH7k7uHlvk3FBn1t+7cH9EBR7CS4VLBJ8DRt/PKu6WCQmNQyQbE/E/nJ?=
	=?us-ascii?Q?Se+fAek4AOUcEmDPIC0hHBYYvv1X4QTqLImvwHerrEgir5PTTA5ctG5otudn?=
	=?us-ascii?Q?IYZ06R2knGiOMVL9Lf1VKeJJv8OhH7ymFcT2ehv4ponEAlV+OuRjULt9Erzy?=
	=?us-ascii?Q?pqqmwcVTlvRYu5rj6GMSCX6MpNt7euLemO1lIF46yOPtb4xhunr8JRTpq7Ko?=
	=?us-ascii?Q?IUVd0eN/KvuybyYdM+KKUUi9KUuVB7gRUGNvjWHlWZ6dTJF6qRbglm7nAj6K?=
	=?us-ascii?Q?xJRTziGyIqrMRZEfx6BY+vhXiFRBAPUKUTwPJnWeXBL3RWMtwP9qaOgxLZZ4?=
	=?us-ascii?Q?WVZ1rNC5xbjhpX2YETUdylI5LzXFhZlYAIpbwpO4rJcqq+9bo3BNzuNF3Xja?=
	=?us-ascii?Q?MXyjRue2lfSAoZcLpWMGGO9umMTBoEQqY/ASlWRaxJz9lF09bINnQMnptRpO?=
	=?us-ascii?Q?UFzKzKomZOeD081E/AKagLN3iIfO8CCJycFnqDsujv/JH7Ig9ZuaEAM8tnPT?=
	=?us-ascii?Q?J7+DHAxq1PsJ9rdimS0q4mqcvtf+4P/GLDUiNnbytl0zioAKcAOfQsfKSXkF?=
	=?us-ascii?Q?9T7z2t+fgDp/PMmIdf/i7bFqTnWJ5k/8XrWpcF2iWoshBTwY1G8Uwxjonf70?=
	=?us-ascii?Q?rW6wyBGZ6LWgg8x672N48Na8eLKuLXvgqocjWww18JwPu1YogLuv09tMrxP2?=
	=?us-ascii?Q?HP4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	5:nw23Volfa4rBuCC2Wr9sC1wDh+vXN4x5CmZG5xxjYPe2fItY1OCgmuYBB1vF95gAx3A7YOuLZd275FfoY80LnjBxidEgRIn2PCewZHdkujkYFT8nKsjcS6idQb6vFNYL6mx3qbFQlZ9qNkKi3LOS8CeIFU2qElOGk4dz2E3qRne5YewRL0bVbEpZne5rKSsuxteIzOINJzRHwr0nBdLzxfLxlduSnaFTneveGRHYf1LWPpJ8sAGqYs7hmvJChT9WQBZwNJm/DXpO/5nvk27xfo+smtZIYjDVUl0jY5QuLC01ejITJbaEDjrsbS06TAxtINZABDAW+7k9bwcsvy0dJmDQVWJY6iwdop1K2L0lDOMHoooeWghTgyl4EyVLVd1ncg6nGYEIWQ2TA+r4YPzBknuAlE53TDDXx538F+z2J4cBe9V/ec5j08ardojniBvYNKpUsp06mEfHgFt5XkNVxF0YKNRVAV/tD7aDHk3vQ2fyzK9ezNCmKuMGDpiJ7O8+;
	24:fAtDSBkOd5jMwvncqEXonLSNYJf/JeST6fnBpJFXyy9FXH+J+3gX9mg6YdsCJmeSwEegNlv+na+qTCJTD+kkScIzTqq6qbvZ3c+YcwiHoPU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	7:wFbaFEP/V4lYs/q3lQPE8GrgJN+LRIZhk+j/svYN+iPuYXGtYJKSuT8LwxjuecMvEQ//7y8bJENuG/co+7ROf6UiiKlrkuBQFSQdlP3OibPUjggc8AIrj49NvhqVxJJfSjei+6Tm47+jsir3VcZ9zfKx6Di7kTAO4yqDhbQyoVwU78GUIxMgXEF1itDnFJlwsgtP4eGAeLpKkqIJXaMq2QVl57iJvex0Jn/afE3r8d0FfdtdU3Rb0HAsAGE1iV+Dens0ECKYANoEHDlO7+2q9JgEdVsKh4t68M4xOP8KOQ8mIvtBsPy4QiXc8GcxpFBezYjQbe3hW8podSXZmAzySBzctqxmhdZBpFMlK+3jDLykq7hzSBHf2/9EVOtlH+HiCqUutX2gJ3LXZpsSOwIY8Ie/nqVDtPh001mBIQG0ucaohxnL2X/kp2NvszVB3Que9N3NoSRD25jCXfIMgIMNbLpcRE2h0GC7SoAG51obBzeyjvvu59SfhloLBod3kVNMEgMm/28tUj5ASCEVRUbcNkJuXuzLtw3TRWwR8r1TXsLScvsumzQOhbHumY6XFePEtI+oaeWo+bn+dyuBQJ5RvAdZtK1gId8Bn9q0LxiPbV+Djkn82rxwzwLgXPyuow4vH1enKtg0fbr+cDJ5JsiUr6YPi2txNByvlT9G/ShQi+RTmXtT1uujVFojT0ouoRrIM0q2ZAnt6fOIvbqC9E9UgMLOVM3qhjVb/rbOC639F9D1rtSURhpsEwK24chXX/B0ZM9l40q9Wm5gv3lDN86LaD7CEWi6iFPupZYkXoGHZeI=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:48:46.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 00/17] new recipe v2: open-vm-tools recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 22:48:48 -0000
Content-Type: text/plain

Hi all,

This is version 2 of a patch series to add a new recipe for Open VM Tools to
meta-oe. This recipe is invaluable for using Openembedded with VMWare, as
without the tools, performance is very slow.

More information about Open VM Tools can be found here:

https://github.com/vmware/open-vm-tools

Please note that, as mentioned in the first commit, this recipe is modified
from the recipe originally found in the Open-Switch repository. The first
patch is directly from that repository, and the following patches are
modifications to it.

Original recipe: https://github.com/open-switch/ops-build
yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9

Although the original recipe packaging was Apache-licensed, I received
permission from the author (Diego Dompe) to relicense it under the MIT license
for inclusion in meta-openembedded:

https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html

The following changes since commit d2da8b82cfb2f8e55236751c1c56c9e7f3b5f68d:

  scsirastools: Upgrade to 1.6.6 (2017-06-22 16:04:14 +0200)

are available in the git repository at:

  git://github.com/XevoInc/meta-openembedded open-vm-tools-v2
  https://github.com/XevoInc/meta-openembedded/tree/open-vm-tools-v2

Martin Kelly (17):
  add open-vm-tools recipe
  open-vm-tools: add missing pkgconfig dependency
  open-vm-tools: add missing glib-2.0-native dependency
  open-vm-tools: clarify and expand licensing
  open-vm-tools: base_contains --> bb.utils.contains
  open-vm-tools: update version to 10.1.5
  open-vm-tools: don't use mspack
  open-vm-tools: don't use dnet-config
  open-vm-tools: add #include to fix build break
  open-vm-tools: add missing X11 dependencies
  open-vm-tools: remove kernel module logic
  open-vm-tools: line up configure options
  open-vm-tools: support FUSE
  open-vm-tools: scope build to only x86
  open-vm-tools: style changes
  open-vm-tools: fix all hardcoded paths
  open-vm-tools: remove -Wno-error

 .../recipes-support/open-vm-tools/files/tools.conf |  2 +
 .../open-vm-tools/files/vmtoolsd.service           | 11 +++
 .../0001-configure.ac-don-t-use-dnet-config.patch  | 41 +++++++++++
 .../0002-add-include-sys-sysmacros.h.patch         | 33 +++++++++
 .../open-vm-tools/open-vm-tools_10.1.5.bb          | 84 ++++++++++++++++++++++
 5 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/tools.conf
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb

-- 
2.11.0


