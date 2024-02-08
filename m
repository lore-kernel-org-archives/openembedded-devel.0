Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5603C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 14:12:37 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.18527.1707401552991328465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 06:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtxTXGOM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56061ad3d3dso1791571a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 06:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707401551; x=1708006351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Eiqb444ieurjo4UyuHWx8oTNaw27xyiwnboPgpPhtU=;
        b=JtxTXGOME35NdQClnJZmxEqNBUTb/q+AqS7lpHZmcyVBI0Nu91ijip8n8H6WDDtbBI
         TtyJVsX9uh4DJEsJd5kHw9jHatm2cQ0SzHQeatTTv8k4u+oHSaQMA1nsTTGzbE8DXLz3
         HKV4M2e7BoWnn+ZSjLwZ7vGvQRXsiVx2gbkFvwyDxuLc+MkPJcqtghLlP3Xfahr3ZLCs
         SVFF8LV9hBhmZCVApIFXp0B80R4whTdeq4o8eH9M/7wlVGjuBHldM7gWIJL3aegfD9eP
         Qdx6EDxYCUlFJRRDw/eD6HbGKyn/drBEQ92zFIGhIrmw8l4LbUaM5WQVIFf6IpXtd0H2
         o5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707401551; x=1708006351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Eiqb444ieurjo4UyuHWx8oTNaw27xyiwnboPgpPhtU=;
        b=dHSE3oBbx2LpwqGQ8THkdLfx66p2hTPbCk8uwJlMfRIrlBUTA3+RvZPjjthxtVToPf
         XzHx3wpKjtwkYV1/2m9UlJ2o9UPYAPHnNmlqEG+/MRvOLS/VnILzYgFRzc6fle8HFHBK
         5Ikya08VWvp9ZoL7tMYkUz2Wna/SGJyI0Vh+ggl93wppzrr9LNU0pdmj1aub0xUFjbMS
         bxrPfgPu7l90wLlW3O+penomgJAtR/retuwoXGTxqKFDCcwP64HwwjZjYi27vKwZjd7q
         DT85xZC39aGL0Vd/MyO+GHHiPyCh2XETw6aOihCx+Za6N5BfODSkL5vvPbQUiE3WO+ia
         w0TQ==
X-Gm-Message-State: AOJu0YwLW5dCBN5f3n5M3H11DCYXbmURCqxwIn0BjywH5T3OyOeh7Zrd
	BvU2N5lQ6esH+ZAR8W4ker85CBc14EspArMx6d901Nv+7x+cU2144yE1/4L/
X-Google-Smtp-Source: AGHT+IFGS8o/RBuS0YmDfItSfWyF6V3+qGfXW3XtqjzczXgmTuXo4UFPP1DiVJc2V6NaYzTawNxclg==
X-Received: by 2002:a50:8d12:0:b0:55f:e2ee:6bba with SMTP id s18-20020a508d12000000b0055fe2ee6bbamr2503248eds.5.1707401550999;
        Thu, 08 Feb 2024 06:12:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURAYURdRJMNkqIB6B5xDNPd56Y993Feif6P5qeq1SqU5tI2y0UwlXcHHAgvwN1il5e3ciWEGxCv3prvrBFQlvIXEurqZMX6vz9imv5WiOxpqk0uCNJNQ4L246mJU9W7q6WBkYzCKp8C+CooGxNjYUDbFev+NsZ5jk=
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v14-20020a056402174e00b0055f4fbc32ccsm848355edx.89.2024.02.08.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 06:12:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com,
	wangmy@fujitsu.com,
	Vyacheslav.Yurkov@bruker.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: upgrade to latest 2024.01.14
Date: Thu,  8 Feb 2024 15:12:25 +0100
Message-ID: <20240208141225.1167317-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 14:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108669

* drop 0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch
  which is now in upstream

* I'm trying to fix random build failure from world builds:
  tests-install sometimes fails as shown bellow:
  mv: failed to preserve ownership for 'group.list': Invalid argument
  not sure if it was resolved already (git log doesn't indicate
  a fix for this), but it's triggered rarely, so I'm waiting if
  jenkins builds happen to trigger this again (before spending
  even more time trying to fix it).

  whole log:
NOTE: make -j 64 DESTDIR=3Dxfstests/2023.10.29/image install
make --no-print-directory Q=3D@ -C include install
make --no-print-directory Q=3D@ -C lib install
make --no-print-directory Q=3D@ -C ltp install
make --no-print-directory Q=3D@ -C src install
make --no-print-directory Q=3D@ -C m4 install
make --no-print-directory Q=3D@ -C common install
make --no-print-directory Q=3D@ -C tests install
make[1]: Nothing to be done for 'install'.
make[1]: Nothing to be done for 'install'.
make[1]: Nothing to be done for 'install'.
../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xfste=
sts/ltp
../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xfste=
sts/common
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/btrfs/ ins=
tall
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/ceph/ inst=
all
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/cifs/ inst=
all
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/ext4/ inst=
all
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/f2fs/ inst=
all
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/generic/ i=
nstall
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/nfs/ insta=
ll
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/ocfs2/ ins=
tall
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/overlay/ i=
nstall
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/perf/ inst=
all
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/selftest/ =
install
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/shared/ in=
stall
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/udf/ insta=
ll
make --no-print-directory Q=3D@ -C xfstests/2023.10.29/git/tests/xfs/ insta=
ll
make -C log-writes install
make -C perf install
make -C vfs install
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/ceph
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/btrfs
Building log-writes
Building perf
Building vfs
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/cifs
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/nfs
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/f2fs
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/ext4
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/perf
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/overlay
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/ocfs2
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/shared
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/selftest
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/udf
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/generic
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/src/log-writes
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/src/perf
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/tests/xfs
../../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xf=
stests/src/vfs
Building include
Building lib
Building tests
Building src
Building m4
Building common
Building ltp
Building ceph
Building btrfs
Building generic
Building ext4
Building ocfs2
Building cifs
Building perf
Building f2fs
Building nfs
Building udf
Building overlay
Building selftest
Building shared
Building xfs
../install-sh -o root -g root -m 644 * xfstests/2023.10.29/image/usr/xfstes=
ts/common
/bin/bash ../libtool --quiet --mode=3Dinstall ../install-sh -o root -g root=
 -m 755 doio fsstress fsx growfiles iogen xfstests/2023.10.29/image/usr/xfs=
tests/ltp
 [GROUP] xfstests/2023.10.29/git/tests/ceph/group.list
 [GROUP] xfstests/2023.10.29/git/tests/ext4/group.list
 [GROUP] xfstests/2023.10.29/git/tests/perf/group.list
 [GROUP] xfstests/2023.10.29/git/tests/btrfs/group.list
 [GROUP] xfstests/2023.10.29/git/tests/generic/group.list
 [GROUP] xfstests/2023.10.29/git/tests/nfs/group.list
 [GROUP] xfstests/2023.10.29/git/tests/ocfs2/group.list
 [GROUP] xfstests/2023.10.29/git/tests/shared/group.list
 [GROUP] xfstests/2023.10.29/git/tests/udf/group.list
 [GROUP] xfstests/2023.10.29/git/tests/cifs/group.list
 [GROUP] xfstests/2023.10.29/git/tests/xfs/group.list
 [GROUP] xfstests/2023.10.29/git/tests/f2fs/group.list
 [GROUP] xfstests/2023.10.29/git/tests/overlay/group.list
 [GROUP] xfstests/2023.10.29/git/tests/selftest/group.list
../../install-sh -o root -g root -m 755 001 002 003 004 005 xfstests/2023.1=
0.29/image/usr/xfstests/tests/ceph
../../install-sh -o root -g root -m 755 102 xfstests/2023.10.29/image/usr/x=
fstests/tests/udf
../../install-sh -o root -g root -m 755 001 xfstests/2023.10.29/image/usr/x=
fstests/tests/cifs
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 007 008 009=
 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 02=
8 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 0=
47 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 =
066 067 068 069 070 071 072 073 074 075 076 077 078 100 101 102 103 104 105=
 106 107 108 109 110 111 112 113 114 115 116 117 xfstests/2023.10.29/image/=
usr/xfstests/tests/overlay
../../install-sh -o root -g root -m 755 001 002 xfstests/2023.10.29/image/u=
sr/xfstests/tests/f2fs
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 007 008 009=
 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 02=
8 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 0=
47 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 =
066 067 068 069 070 071 072 073 074 075 076 077 078 079 080 081 082 083 084=
 085 086 087 088 089 090 091 092 093 094 095 096 097 098 099 100 101 102 10=
3 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 1=
22 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 =
141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159=
 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 17=
8 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 1=
97 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 =
216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234=
 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 25=
3 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 2=
72 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 =
291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309=
 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 32=
8 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 3=
47 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 =
366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 381 382 383 384=
 385 386 387 388 389 390 391 392 393 394 395 396 397 398 399 400 401 402 40=
3 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 419 420 421 4=
22 423 424 425 426 427 428 429 430 431 432 433 434 435 436 437 438 439 440 =
441 442 443 444 445 446 447 448 449 450 451 452 453 454 455 456 457 458 459=
 460 461 462 463 464 465 466 467 468 469 470 471 472 473 474 475 476 477 47=
8 479 480 481 482 483 484 485 486 487 488 489 490 491 492 493 494 495 496 4=
97 498 499 500 501 502 503 504 505 506 507 508 509 510 511 512 513 514 515 =
516 517 518 519 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534=
 535 536 537 538 539 540 541 542 543 544 545 546 547 548 549 550 551 552 55=
3 554 555 556 557 558 559 560 561 562 563 564 565 566 567 568 569 570 571 5=
72 573 574 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 =
591 592 593 594 595 596 597 598 599 600 601 602 603 604 605 606 607 608 609=
 610 611 612 613 614 615 616 617 618 619 620 621 622 623 624 625 626 627 62=
8 629 630 631 632 633 634 635 636 637 638 639 640 641 642 643 644 645 646 6=
47 648 649 650 651 652 653 654 655 656 657 658 659 660 661 662 663 664 665 =
666 667 668 669 670 671 672 673 674 675 676 677 678 679 680 681 682 683 684=
 685 686 687 688 689 690 691 692 693 694 695 696 697 698 699 700 701 702 70=
3 704 705 706 707 708 709 710 711 712 713 714 715 716 717 718 719 720 721 7=
22 723 724 725 726 727 xfstests/2023.10.29/image/usr/xfstests/tests/generic
../../install-sh -o root -g root -m 755 001 xfstests/2023.10.29/image/usr/x=
fstests/tests/nfs
../../install-sh -o root -g root -m 755 FioCompare.py fio-insert-and-compar=
e.py FioResultDecoder.py generate-schema.py ResultData.py fio-results.sql x=
fstests/2023.10.29/image/usr/xfstests/src/perf
../../install-sh -o root -g root -m 755 001 xfstests/2023.10.29/image/usr/x=
fstests/tests/perf
../../install-sh -o root -g root -m 755 001 xfstests/2023.10.29/image/usr/x=
fstests/tests/ocfs2
../../install-sh -o root -g root -m 755 vfstest mount-idmapped xfstests/202=
3.10.29/image/usr/xfstests/src/vfs
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 007 008 009=
 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 02=
8 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 0=
47 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 =
066 067 068 069 070 071 072 073 074 075 076 077 078 079 080 081 082 083 084=
 085 086 087 088 089 090 091 092 093 094 095 096 097 098 099 100 101 102 10=
3 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 1=
22 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 =
141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159=
 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 17=
8 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 1=
97 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 =
216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234=
 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 25=
3 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 2=
72 273 274 275 276 277 278 279 280 281 282 283 284 285 286 290 291 299 xfst=
ests/2023.10.29/image/usr/xfstests/tests/btrfs
../../install-sh -o root -g root -m 755 002 032 298 xfstests/2023.10.29/ima=
ge/usr/xfstests/tests/shared
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 007 008 009=
 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 02=
8 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 0=
47 048 049 050 051 052 053 054 055 056 057 058 059 271 301 302 303 304 305 =
306 307 308 xfstests/2023.10.29/image/usr/xfstests/tests/ext4
../../install-sh -o root -g root -m 755 replay-log xfstests/2023.10.29/imag=
e/usr/xfstests/src/log-writes
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 xfstests/20=
23.10.29/image/usr/xfstests/tests/selftest
../../install-sh -o root -g root -m 755 001 002 003 004 005 006 007 008 009=
 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025 026 027 02=
8 029 030 031 032 033 034 035 036 037 038 039 040 041 042 043 044 045 046 0=
47 048 049 050 051 052 053 054 055 056 057 058 059 060 061 062 063 064 065 =
066 067 068 069 070 071 072 073 074 075 076 077 078 079 080 081 082 083 084=
 085 086 087 088 089 090 091 092 093 094 095 096 097 098 099 100 101 102 10=
3 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 1=
22 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 =
141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159=
 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 17=
8 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 1=
97 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 =
216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234=
 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 25=
3 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 2=
72 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 =
291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309=
 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 32=
8 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 3=
47 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 =
366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 381 382 383 384=
 385 386 387 388 389 390 391 392 393 394 395 396 397 398 399 400 401 402 40=
3 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 419 420 421 4=
22 423 424 425 426 427 428 429 430 431 432 433 434 435 436 437 438 439 440 =
441 442 443 444 445 446 447 448 449 450 451 452 453 454 455 456 457 458 459=
 460 461 462 463 464 465 466 467 468 469 470 471 472 473 474 475 476 477 47=
8 479 480 481 482 483 484 485 486 487 488 489 490 491 492 493 494 495 496 4=
97 498 499 500 501 502 503 504 505 506 507 508 509 510 511 512 513 514 515 =
516 517 518 519 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534=
 535 536 537 538 539 540 541 542 543 544 545 546 547 548 549 550 551 552 55=
3 554 555 556 557 558 559 560 561 562 563 564 565 566 567 568 570 571 572 5=
73 574 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 591 =
592 593 594 595 708 709 710 711 712 713 714 715 716 717 718 719 720 721 722=
 723 724 725 726 727 728 729 730 731 732 733 734 735 736 737 738 739 740 74=
1 742 743 744 745 746 747 748 749 750 751 752 753 754 755 756 757 758 759 7=
60 761 762 763 764 765 766 767 768 769 770 771 772 773 774 775 776 777 778 =
779 780 781 782 783 784 785 786 787 788 789 790 791 792 793 794 795 796 797=
 798 xfstests/2023.10.29/image/usr/xfstests/tests/xfs
Building perf
Building log-writes
Building vfs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/cifs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/perf
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/udf
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/ocfs2
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/nfs
mv: failed to preserve ownership for 'group.list': Invalid argument
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh: group.list does not exist.
make[2]: *** [Makefile:20: install] Error 1
mv: failed to preserve ownership for 'group.list'make[1]: *** [Makefile:23:=
 xfstests/2023.10.29/git/tests/nfs/-install] Error 2
: Invalid argumentmake[1]: *** Waiting for unfinished jobs....

mv: failed to preserve ownership for 'group.list': Invalid argument
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644   001.out xfstests/2023.10.29/image=
/usr/xfstests/tests/cifs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/f2fs
../../install-sh -o root -g root -m 644   001.out xfstests/2023.10.29/image=
/usr/xfstests/tests/perf
mv: failed to preserve ownership for 'group.list': Invalid argument
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644   102.out xfstests/2023.10.29/image=
/usr/xfstests/tests/udf
../../install-sh -o root -g root -m 644   001.out xfstests/2023.10.29/image=
/usr/xfstests/tests/ocfs2
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/shared
../../install-sh -o root -g root -m 644   001.out 002.out xfstests/2023.10.=
29/image/usr/xfstests/tests/f2fs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/ceph
../../install-sh -o root -g root -m 644   002.out 032.out 298.out xfstests/=
2023.10.29/image/usr/xfstests/tests/shared
../install-sh -o root -g root -m 755 -d xfstests/2023.10.29/image/usr/xfste=
sts/src
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/selftest
../../install-sh -o root -g root -m 644   001.out 002.out 003.out 004.out 0=
05.out xfstests/2023.10.29/image/usr/xfstests/tests/ceph
/bin/bash ../libtool --quiet --mode=3Dinstall ../install-sh -o root -g root=
 -m 755 dirstress fill fill2 getpagesize holes lstat64 nametest permname ra=
ndholes runas truncfile usemem mmapcat append_reader append_writer dirperf =
metaperf devzero feature alloc fault fstest t_access_root godown resvtest w=
ritemod writev_on_pagefault makeextents itrash rename multi_open_unlink unw=
ritten_sync genhashnames t_holes t_mmap_writev t_truncate_cmtime dirhash_co=
llide t_rename_overwrite holetest t_truncate_self af_unix t_mmap_stale_pmd =
t_mmap_cow_race t_mmap_fallocate fsync-err t_mmap_write_ro t_ext4_dax_journ=
al_corruption t_ext4_dax_inline_corruption t_ofd_locks t_mmap_collision mma=
p-write-concurrent t_get_file_time t_create_short_dirs t_create_long_dirs t=
_enospc t_mmap_writev_overlap checkpoint_journal mmap-rw-fault allocstale t=
_mmap_cow_memory_failure fake-dump-rootino dio-buf-fault xfsctl bstat t_mta=
b getdevicesize preallo_rw_pattern_reader preallo_rw_pattern_writer ftrunc =
trunc fs_perms testx looptest locktest unwritten_mmap bulkstat_unlink_test =
deduperace bulkstat_unlink_test_modified t_dir_offset t_futimens t_immutabl=
e stale_handle pwrite_mmap_blocked t_dir_offset2 seek_sanity_test seek_copy=
_test t_readdir_1 t_readdir_2 fsync-tester nsexec cloner renameat2 t_getcwd=
 e4compact test-nextquota punch-alternating attr-list-by-handle-cursor-test=
 listxattr dio-interleaved t_dir_type dio-invalidate-cache stat_test t_encr=
ypted_d_revalidate attr_replace_test swapon mkswap t_attr_corruption t_open=
_tmpfiles fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail=
 ext4_resize t_readdir_3 splice2pipe uuid_ioctl fiemap-tester t_stripealign=
 open_by_handle xfsfind fssum xfstests/2023.10.29/image/usr/xfstests/src
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644   001.out 002.out 003.out 004.out 0=
05.out 006.out xfstests/2023.10.29/image/usr/xfstests/tests/selftest
mv: failed to preserve ownership for 'group.list': Invalid argument
../install-sh -o root -g root -m 755 rwtest.sh xfstests/2023.10.29/image/us=
r/xfstests/ltp
mv: failed to preserve ownership for 'group.list': Invalid argument
mv: failed to preserve ownership for 'group.list': Invalid argument
mv: failed to preserve ownership for 'group.list': Invalid argument
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/ext4
../../install-sh -o root -g root -m 644 001.out.default 001.out.nodelalloc =
001.out.nozero 001.cfg 002.out 003.out 004.out 005.out 006.out 007.out 008.=
out 009.out 010.out 011.out 012.out 013.out 014.out 015.out 016.out 017.out=
 018.out 019.out 020.out 021.out 022.out 023.out 024.out 025.out 026.out 02=
7.out 028.out 029.out 030.out 031.out 032.out 033.out 034.out 035.out 036.o=
ut 037.out 038.out 039.out 040.out 041.out 042.out 043.out 044.out 045.out =
046.out 047.out 048.out 049.out 050.out 051.out 052.out 053.out 054.out 055=
.out 056.out 057.out 058.out 059.out 271.out 301.out 302.out 303.out 304.ou=
t 305.out 306.out 307.out 308.out xfstests/2023.10.29/image/usr/xfstests/te=
sts/ext4
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/overlay
../../install-sh -o root -g root -m 644   001.out 002.out 003.out 004.out 0=
05.out 006.out 007.out 008.out 009.out 010.out 011.out 012.out 013.out 014.=
out 015.out 016.out 017.out 018.out 019.out 020.out 021.out 022.out 023.out=
 024.out 025.out 026.out 027.out 028.out 029.out 030.out 031.out 032.out 03=
3.out 034.out 035.out 036.out 037.out 038.out 039.out 040.out 041.out 042.o=
ut 043.out 044.out 045.out 046.out 047.out 048.out 049.out 050.out 051.out =
052.out 053.out 054.out 055.out 056.out 057.out 058.out 059.out 060.out 061=
.out 062.out 063.out 064.out 065.out 066.out 067.out 068.out 069.out 070.ou=
t 071.out 072.out 073.out 074.out 075.out 076.out 077.out 078.out 100.out 1=
01.out 102.out 103.out 104.out 105.out 106.out 107.out 108.out 109.out 110.=
out 111.out 112.out 113.out 114.out 115.out 116.out 117.out xfstests/2023.1=
0.29/image/usr/xfstests/tests/overlay
/bin/bash ../libtool --quiet --mode=3Dinstall ../install-sh -o root -g root=
 -m 755 dmerror fill2attr fill2fs fill2fs_check scaleread.sh btrfs_crc32c_f=
orged_name.py popdir.pl popattr.py xfstests/2023.10.29/image/usr/xfstests/s=
rc
/bin/bash ../libtool --quiet --mode=3Dinstall ../install-sh -o root -g root=
 -m 644 dumpfile xfstests/2023.10.29/image/usr/xfstests/src
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/btrfs
../../install-sh -o root -g root -m 644   001.out 002.out 003.out 004.out 0=
05.out 006.out 007.out 008.out 009.out 010.out 011.out 012.out 013.out 014.=
out 015.out 016.out 017.out 018.out 019.out 020.out 021.out 022.out 023.out=
 024.out 025.out 026.out 027.out 028.out 029.out 030.out 031.out 032.out 03=
3.out 034.out 035.out 036.out 037.out 038.out 039.out 040.out 041.out 042.o=
ut 043.out 044.out 045.out 046.out 047.out 048.out 049.out 050.out 051.out =
052.out 053.out 054.out 055.out 056.out 057.out 058.out 059.out 060.out 061=
.out 062.out 063.out 064.out 065.out 066.out 067.out 068.out 069.out 070.ou=
t 071.out 072.out 073.out 074.out 075.out 076.out 077.out 078.out 079.out 0=
80.out 081.out 082.out 083.out 084.out 085.out 086.out 087.out 088.out 089.=
out 090.out 091.out 092.out 093.out 094.out 095.out 096.out 097.out 098.out=
 099.out 100.out 101.out 102.out 103.out 104.out 105.out 106.out 107.out 10=
8.out 109.out 110.out 111.out 112.out 113.out 114.out 115.out 116.out 117.o=
ut 118.out 119.out 120.out 121.out 122.out 123.out 124.out 125.out 126.out =
127.out 128.out 129.out 130.out 131.out 132.out 133.out 134.out 135.out 136=
.out 137.out 138.out 139.out 140.out 141.out 142.out 143.out 144.out 145.ou=
t 146.out 147.out 148.out 149.out 150.out 151.out 152.out 153.out 154.out 1=
55.out 156.out 157.out 158.out 159.out 160.out 161.out 162.out 163.out 164.=
out 165.out 166.out 167.out 168.out 169.out 170.out 171.out 172.out 173.out=
 174.out 175.out 176.out 177.out 178.out 179.out 180.out 181.out 182.out 18=
3.out 184.out 185.out 186.out 187.out 188.out 189.out 190.out 191.out 192.o=
ut 193.out 194.out 195.out 196.out 197.out 198.out 199.out 200.out 201.out =
202.out 203.out 204.out 205.out 206.out 207.out 208.out 209.out 210.out 211=
.out 212.out 213.out 214.out 215.out 216.out 217.out 218.out 219.out 220.ou=
t 221.out 222.out 223.out 224.out 225.out 226.out 227.out 228.out 229.out 2=
30.out 231.out 232.out 233.out 234.out 235.out 236.out 237.out 238.out 239.=
out 240.out 241.out 242.out 243.out 244.out 245.out 246.out 247.out 248.out=
 249.out 250.out 251.out 252.out 253.out 254.out 255.out 256.out 257.out 25=
8.out 259.out 260.out 261.out 262.out 263.out 264.out 265.out 266.out 267.o=
ut 268.out 269.out 270.out 271.out 272.out 273.out 274.out 275.out 276.out =
277.out 278.out 279.out 280.out 281.out 282.out 283.out 284.out 285.out 286=
.out 290.out 291.out 299.out xfstests/2023.10.29/image/usr/xfstests/tests/b=
trfs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/xfs
../../install-sh -o root -g root -m 644 033.out.crc 033.out.default 071.out=
.32 071.out.64 096.out.external 096.out.internal 216.out.64mblog 216.out.cl=
assic 033.cfg 216.cfg 001.out 002.out 003.out 004.out 005.out 006.out 007.o=
ut 008.out 009.out 010.out 011.out 012.out 013.out 014.out 015.out 016.out =
017.out 018.out 019.out 020.out 021.out 022.out 023.out 024.out 025.out 026=
.out 027.out 028.out 029.out 030.out 031.out 032.out 034.out 035.out 036.ou=
t 037.out 038.out 039.out 040.out 041.out 042.out 043.out 044.out 045.out 0=
46.out 047.out 048.out 049.out 050.out 051.out 052.out 053.out 054.out 055.=
out 056.out 057.out 058.out 059.out 060.out 061.out 062.out 063.out 064.out=
 065.out 066.out 067.out 068.out 069.out 070.out 072.out 073.out 074.out 07=
5.out 076.out 077.out 078.out 079.out 080.out 081.out 082.out 083.out 084.o=
ut 085.out 086.out 087.out 088.out 089.out 090.out 091.out 092.out 093.out =
094.out 095.out 097.out 098.out 099.out 100.out 101.out 102.out 103.out 104=
.out 105.out 106.out 107.out 108.out 109.out 110.out 111.out 112.out 113.ou=
t 114.out 115.out 116.out 117.out 118.out 119.out 120.out 121.out 122.out 1=
23.out 124.out 125.out 126.out 127.out 128.out 129.out 130.out 131.out 132.=
out 133.out 134.out 135.out 136.out 137.out 138.out 139.out 140.out 141.out=
 142.out 143.out 144.out 145.out 146.out 147.out 148.out 149.out 150.out 15=
1.out 152.out 153.out 154.out 155.out 156.out 157.out 158.out 159.out 160.o=
ut 161.out 162.out 163.out 164.out 165.out 166.out 167.out 168.out 169.out =
170.out 171.out 172.out 173.out 174.out 175.out 176.out 177.out 178.out 179=
.out 180.out 181.out 182.out 183.out 184.out 185.out 186.out 187.out 188.ou=
t 189.out 190.out 191.out 192.out 193.out 194.out 195.out 196.out 197.out 1=
98.out 199.out 200.out 201.out 202.out 203.out 204.out 205.out 206.out 207.=
out 208.out 209.out 210.out 211.out 212.out 213.out 214.out 215.out 217.out=
 218.out 219.out 220.out 221.out 222.out 223.out 224.out 225.out 226.out 22=
7.out 228.out 229.out 230.out 231.out 232.out 233.out 234.out 235.out 236.o=
ut 237.out 238.out 239.out 240.out 241.out 242.out 243.out 244.out 245.out =
246.out 247.out 248.out 249.out 250.out 251.out 252.out 253.out 254.out 255=
.out 256.out 257.out 258.out 259.out 260.out 261.out 262.out 263.out 264.ou=
t 265.out 266.out 267.out 268.out 269.out 270.out 271.out 272.out 273.out 2=
74.out 275.out 276.out 277.out 278.out 279.out 280.out 281.out 282.out 283.=
out 284.out 285.out 286.out 287.out 288.out 289.out 290.out 291.out 292.out=
 293.out 294.out 295.out 296.out 297.out 298.out 299.out 300.out 301.out 30=
2.out 303.out 304.out 305.out 306.out 307.out 308.out 309.out 310.out 311.o=
ut 312.out 313.out 314.out 315.out 316.out 317.out 318.out 319.out 320.out =
321.out 322.out 323.out 324.out 325.out 326.out 327.out 328.out 329.out 330=
.out 331.out 332.out 333.out 334.out 335.out 336.out 337.out 338.out 339.ou=
t 340.out 341.out 342.out 343.out 344.out 345.out 346.out 347.out 348.out 3=
49.out 350.out 351.out 352.out 353.out 354.out 355.out 356.out 357.out 358.=
out 359.out 360.out 361.out 362.out 363.out 364.out 365.out 366.out 367.out=
 368.out 369.out 370.out 371.out 372.out 373.out 374.out 375.out 376.out 37=
7.out 378.out 379.out 380.out 381.out 382.out 383.out 384.out 385.out 386.o=
ut 387.out 388.out 389.out 390.out 391.out 392.out 393.out 394.out 395.out =
396.out 397.out 398.out 399.out 400.out 401.out 402.out 403.out 404.out 405=
.out 406.out 407.out 408.out 409.out 410.out 411.out 412.out 413.out 414.ou=
t 415.out 416.out 417.out 418.out 419.out 420.out 421.out 422.out 423.out 4=
24.out 425.out 426.out 427.out 428.out 429.out 430.out 431.out 432.out 433.=
out 434.out 435.out 436.out 437.out 438.out 439.out 440.out 441.out 442.out=
 443.out 444.out 445.out 446.out 447.out 448.out 449.out 450.out 451.out 45=
2.out 453.out 454.out 455.out 456.out 457.out 458.out 459.out 460.out 461.o=
ut 462.out 463.out 464.out 465.out 466.out 467.out 468.out 469.out 470.out =
471.out 472.out 473.out 474.out 475.out 476.out 477.out 478.out 479.out 480=
.out 481.out 482.out 483.out 484.out 485.out 486.out 487.out 488.out 489.ou=
t 490.out 491.out 492.out 493.out 494.out 495.out 496.out 497.out 498.out 4=
99.out 500.out 501.out 502.out 503.out 504.out 505.out 506.out 507.out 508.=
out 509.out 510.out 511.out 512.out 513.out 514.out 515.out 516.out 517.out=
 518.out 519.out 520.out 521.out 522.out 523.out 524.out 525.out 526.out 52=
7.out 528.out 529.out 530.out 531.out 532.out 533.out 534.out 535.out 536.o=
ut 537.out 538.out 539.out 540.out 541.out 542.out 543.out 544.out 545.out =
546.out 547.out 548.out 549.out 550.out 551.out 552.out 553.out 554.out 555=
.out 556.out 557.out 558.out 559.out 560.out 561.out 562.out 563.out 564.ou=
t 565.out 566.out 567.out 568.out 570.out 571.out 572.out 573.out 574.out 5=
75.out 576.out 577.out 578.out 579.out 580.out 581.out 582.out 583.out 584.=
out 585.out 586.out 587.out 588.out 589.out 590.out 591.out 592.out 593.out=
 594.out 595.out 708.out 709.out 710.out 711.out 712.out 713.out 714.out 71=
5.out 716.out 717.out 718.out 719.out 720.out 721.out 722.out 723.out 724.o=
ut 725.out 726.out 727.out 728.out 729.out 730.out 731.out 732.out 733.out =
734.out 735.out 736.out 737.out 738.out 739.out 740.out 741.out 742.out 743=
.out 744.out 745.out 746.out 747.out 748.out 749.out 750.out 751.out 752.ou=
t 753.out 754.out 755.out 756.out 757.out 758.out 759.out 760.out 761.out 7=
62.out 763.out 764.out 765.out 766.out 767.out 768.out 769.out 770.out 771.=
out 772.out 773.out 774.out 775.out 776.out 777.out 778.out 779.out 780.out=
 781.out 782.out 783.out 784.out 785.out 786.out 787.out 788.out 789.out 79=
0.out 791.out 792.out 793.out 794.out 795.out 796.out 797.out 798.out xfste=
sts/2023.10.29/image/usr/xfstests/tests/xfs
../../install-sh -o root -g root -m 644 group.list xfstests/2023.10.29/imag=
e/usr/xfstests/tests/generic
../../install-sh -o root -g root -m 644 035.out.default 035.out.nfs 050.out=
.default 050.out.nojournal 050.out.xfsquota 035.cfg 050.cfg 001.out 002.out=
 003.out 004.out 005.out 006.out 007.out 008.out 009.out 010.out 011.out 01=
2.out 013.out 014.out 015.out 016.out 017.out 018.out 019.out 020.out 021.o=
ut 022.out 023.out 024.out 025.out 026.out 027.out 028.out 029.out 030.out =
031.out 032.out 033.out 034.out 036.out 037.out 038.out 039.out 040.out 041=
.out 042.out 043.out 044.out 045.out 046.out 047.out 048.out 049.out 051.ou=
t 052.out 053.out 054.out 055.out 056.out 057.out 058.out 059.out 060.out 0=
61.out 062.out 063.out 064.out 065.out 066.out 067.out 068.out 069.out 070.=
out 071.out 072.out 073.out 074.out 075.out 076.out 077.out 078.out 079.out=
 080.out 081.out 082.out 083.out 084.out 085.out 086.out 087.out 088.out 08=
9.out 090.out 091.out 092.out 093.out 094.out 095.out 096.out 097.out 098.o=
ut 099.out 100.out 101.out 102.out 103.out 104.out 105.out 106.out 107.out =
108.out 109.out 110.out 111.out 112.out 113.out 114.out 115.out 116.out 117=
.out 118.out 119.out 120.out 121.out 122.out 123.out 124.out 125.out 126.ou=
t 127.out 128.out 129.out 130.out 131.out 132.out 133.out 134.out 135.out 1=
36.out 137.out 138.out 139.out 140.out 141.out 142.out 143.out 144.out 145.=
out 146.out 147.out 148.out 149.out 150.out 151.out 152.out 153.out 154.out=
 155.out 156.out 157.out 158.out 159.out 160.out 161.out 162.out 163.out 16=
4.out 165.out 166.out 167.out 168.out 169.out 170.out 171.out 172.out 173.o=
ut 174.out 175.out 176.out 177.out 178.out 179.out 180.out 181.out 182.out =
183.out 184.out 185.out 186.out 187.out 188.out 189.out 190.out 191.out 192=
.out 193.out 194.out 195.out 196.out 197.out 198.out 199.out 200.out 201.ou=
t 202.out 203.out 204.out 205.out 206.out 207.out 208.out 209.out 210.out 2=
11.out 212.out 213.out 214.out 215.out 216.out 217.out 218.out 219.out 220.=
out 221.out 222.out 223.out 224.out 225.out 226.out 227.out 228.out 229.out=
 230.out 231.out 232.out 233.out 234.out 235.out 236.out 237.out 238.out 23=
9.out 240.out 241.out 242.out 243.out 244.out 245.out 246.out 247.out 248.o=
ut 249.out 250.out 251.out 252.out 253.out 254.out 255.out 256.out 257.out =
258.out 259.out 260.out 261.out 262.out 263.out 264.out 265.out 266.out 267=
.out 268.out 269.out 270.out 271.out 272.out 273.out 274.out 275.out 276.ou=
t 277.out 278.out 279.out 280.out 281.out 282.out 283.out 284.out 285.out 2=
86.out 287.out 288.out 289.out 290.out 291.out 292.out 293.out 294.out 295.=
out 296.out 297.out 298.out 299.out 300.out 301.out 302.out 303.out 304.out=
 305.out 306.out 307.out 308.out 309.out 310.out 311.out 312.out 313.out 31=
4.out 315.out 316.out 317.out 318.out 319.out 320.out 321.out 322.out 323.o=
ut 324.out 325.out 326.out 327.out 328.out 329.out 330.out 331.out 332.out =
333.out 334.out 335.out 336.out 337.out 338.out 339.out 340.out 341.out 342=
.out 343.out 344.out 345.out 346.out 347.out 348.out 349.out 350.out 351.ou=
t 352.out 353.out 354.out 355.out 356.out 357.out 358.out 359.out 360.out 3=
61.out 362.out 363.out 364.out 365.out 366.out 367.out 368.out 369.out 370.=
out 371.out 372.out 373.out 374.out 375.out 376.out 377.out 378.out 379.out=
 380.out 381.out 382.out 383.out 384.out 385.out 386.out 387.out 388.out 38=
9.out 390.out 391.out 392.out 393.out 394.out 395.out 396.out 397.out 398.o=
ut 399.out 400.out 401.out 402.out 403.out 404.out 405.out 406.out 407.out =
408.out 409.out 410.out 411.out 412.out 413.out 414.out 415.out 416.out 417=
.out 418.out 419.out 420.out 421.out 422.out 423.out 424.out 425.out 426.ou=
t 427.out 428.out 429.out 430.out 431.out 432.out 433.out 434.out 435.out 4=
36.out 437.out 438.out 439.out 440.out 441.out 442.out 443.out 444.out 445.=
out 446.out 447.out 448.out 449.out 450.out 451.out 452.out 453.out 454.out=
 455.out 456.out 457.out 458.out 459.out 460.out 461.out 462.out 463.out 46=
4.out 465.out 466.out 467.out 468.out 469.out 470.out 471.out 472.out 473.o=
ut 474.out 475.out 476.out 477.out 478.out 479.out 480.out 481.out 482.out =
483.out 484.out 485.out 486.out 487.out 488.out 489.out 490.out 491.out 492=
.out 493.out 494.out 495.out 496.out 497.out 498.out 499.out 500.out 501.ou=
t 502.out 503.out 504.out 505.out 506.out 507.out 508.out 509.out 510.out 5=
11.out 512.out 513.out 514.out 515.out 516.out 517.out 518.out 519.out 520.=
out 521.out 522.out 523.out 524.out 525.out 526.out 527.out 528.out 529.out=
 530.out 531.out 532.out 533.out 534.out 535.out 536.out 537.out 538.out 53=
9.out 540.out 541.out 542.out 543.out 544.out 545.out 546.out 547.out 548.o=
ut 549.out 550.out 551.out 552.out 553.out 554.out 555.out 556.out 557.out =
558.out 559.out 560.out 561.out 562.out 563.out 564.out 565.out 566.out 567=
.out 568.out 569.out 570.out 571.out 572.out 573.out 574.out 575.out 576.ou=
t 577.out 578.out 579.out 580.out 581.out 582.out 583.out 584.out 585.out 5=
86.out 587.out 588.out 589.out 590.out 591.out 592.out 593.out 594.out 595.=
out 596.out 597.out 598.out 599.out 600.out 601.out 602.out 603.out 604.out=
 605.out 606.out 607.out 608.out 609.out 610.out 611.out 612.out 613.out 61=
4.out 615.out 616.out 617.out 618.out 619.out 620.out 621.out 622.out 623.o=
ut 624.out 625.out 626.out 627.out 628.out 629.out 630.out 631.out 632.out =
633.out 634.out 635.out 636.out 637.out 638.out 639.out 640.out 641.out 642=
.out 643.out 644.out 645.out 646.out 647.out 648.out 649.out 650.out 651.ou=
t 652.out 653.out 654.out 655.out 656.out 657.out 658.out 659.out 660.out 6=
61.out 662.out 663.out 664.out 665.out 666.out 667.out 668.out 669.out 670.=
out 671.out 672.out 673.out 674.out 675.out 676.out 677.out 678.out 679.out=
 680.out 681.out 682.out 683.out 684.out 685.out 686.out 687.out 688.out 68=
9.out 690.out 691.out 692.out 693.out 694.out 695.out 696.out 697.out 698.o=
ut 699.out 700.out 701.out 702.out 703.out 704.out 705.out 706.out 707.out =
708.out 709.out 710.out 711.out 712.out 713.out 714.out 715.out 716.out 717=
.out 718.out 719.out 720.out 721.out 722.out 723.out 724.out 725.out 726.ou=
t 727.out xfstests/2023.10.29/image/usr/xfstests/tests/generic
make: *** [Makefile:89: tests-install] Error 2
ERROR: oe_runmake failed

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...itly-use-int-for-return-type-for-aio.patch | 30 -------------------
 ...unts_propagation-and-remove-sys-moun.patch |  9 +++---
 ...s_2023.10.29.bb =3D> xfstests_2024.01.14.bb} |  3 +-
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-l=
tp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2023.10.29.bb =3D=
> xfstests_2024.01.14.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.=
h-Explicitly-use-int-for-return-type-for-aio.patch b/meta-filesystems/recip=
es-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-typ=
e-for-aio.patch
deleted file mode 100644
index 5e9e9d9a79..0000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Expli=
citly-use-int-for-return-type-for-aio.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0927d0def968ea7e19905c7e39182f65961c11cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Nov 2023 01:17:52 -0700
-Subject: [PATCH] ltp/fsx.h: Explicitly use int for return type for aio_rw()
-
-Fixes build with clang-17+
-error: type specifier missing, defaults to 'int'; ISO C99 and later do not=
 support implicit int [-Wimplicit-int]
-
-Upstream-Status: Submitted [https://marc.info/?l=3Dfstests&m=3D16991722200=
8646&w=3D2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltp/fsx.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltp/fsx.c b/ltp/fsx.c
-index ee4b8fe4..c0aec23f 100644
---- a/ltp/fsx.c
-+++ b/ltp/fsx.c
-@@ -2581,7 +2581,7 @@ out_error:
- 	return -1;
- }
- #else
--aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
-+int aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
- {
- 	fprintf(stderr, "io_rw: need AIO support!\n");
- 	exit(111);
---=20
-2.42.1
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-det=
ached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/recip=
es-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove=
-sys-moun.patch
index 856fd270f5..e823297343 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_m=
ounts_propagation-and-remove-sys-moun.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_m=
ounts_propagation-and-remove-sys-moun.patch
@@ -1,4 +1,4 @@
-From 559f685f83d12d11bf9ec6c6ce924ee4d0702a2a Mon Sep 17 00:00:00 2001
+From 79c4715a46b80653eb98b61731c094c85e969220 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Aug 2022 13:33:05 -0700
 Subject: [PATCH] Drop detached_mounts_propagation and remove sys/mount.h f=
rom
@@ -12,21 +12,20 @@ testcase
 Upstream-Status: Inappropriate [Libc specific Workaround]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index 2815f919..448fccc9 100644
+index e7442487..970f087a 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -32,7 +32,7 @@ LINUX_TARGETS =3D xfsctl bstat t_mtab getdevicesize prea=
llo_rw_pattern_reader \
+@@ -33,7 +33,7 @@ LINUX_TARGETS =3D xfsctl bstat t_mtab getdevicesize prea=
llo_rw_pattern_reader \
  	dio-invalidate-cache stat_test t_encrypted_d_revalidate \
  	attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles \
  	fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail \
 -	detached_mounts_propagation ext4_resize t_readdir_3 splice2pipe \
 +	ext4_resize t_readdir_3 splice2pipe \
- 	uuid_ioctl
+ 	uuid_ioctl t_snapshot_deleted_subvolume
=20=20
  EXTRA_EXECS =3D dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb=
 b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index 4e8e318409..e644272a51 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -7,12 +7,11 @@ SRCREV_FORMAT =3D "xfstests_unionmount"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dfor-next;name=3Dxfstests \
            git://github.com/amir73il/unionmount-testsuite.git;branch=3Dmas=
ter;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite \
-           file://0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-ai=
o.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-mou=
n.patch \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.=
patch \
            "
=20
-SRCREV_xfstests =3D "f7765774a1b5cb98c2f21a892e82b3421f40e791"
+SRCREV_xfstests =3D "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
 SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


